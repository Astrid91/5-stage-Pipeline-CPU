# 5-stage-Pipeline-CPU

## 背景
此次Project以Midterm Project所設計之 ALU Design 為基礎，參考課本Chapter 4 與課程講義之Pipelined Datapath ，設計一個 Pipelined MIPS Lite CPU包含以下16項功能。

(a) Integer Arithmet ic: add, sub, and, or, sl l , slt , ori

(b) Integer Memory Access: lw, sw

(c) Integer Branch: beq, bne j

(d) Integer Multiply / Divide : divu

(e) Other Instructions : mfhi, mflo , nop

## 方法(設計重點說明)
### 1.	IF:
(1)	下一道指令是論是否jump或branch都需計算PC=PC+4。

(2)	PC多工器選擇是否要執行jump或brunch，將下一個位址傳入PC。

(3)	根據PC值讀入指令後，判斷是否發生hazard，若需要加入bubble時，則傳入32位元皆為0的指令，該指令根據需要延後多少cycle之後在讀入。



### 2.	ID:
(1)	從IF階段取得的32bits指令，根據需求切割成opcode、funct、rs、rt、rd、shamt、offset，和立即值等。

(2)	將16bits立即值有號數擴充成32bits。

(3)	將opcode和funct及其它需要用到的控制訊號傳入Control。

(4)	根據rs和rt分別讀入RN1和RN2，從register file中找到相對相對應的暫存器位置，並根據控制訊號決定讀出或寫入，輸出路線為RD1和RD2。

### 3.	EX:
(1) 計算32位元立即值右移2(乘4)，並加上(pc+4)，供brunch使用。

(2) TotalLALU:top module - 用以整合所有 module。
 
#### (a) ALU: 
使用Gate-Level Modeling與Data Flow Modeling (Continuous Assignments)設計包含32-bits AND, OR, ADD, SUB, SLT等功能，從 Full Adder 做起，並以 Ripple-Carry 的進位方式，連接32個1-bit ALU Bit Slice成為 32-bit ALU。
接收來自ALU Control的Signal訊號決定輸出哪種運算結果，其中第0個ALU Slice的Less輸入為第31個ALU Slice的Set輸出，第2到31個ALU Slice的Less輸入則為0，即可達到SLT之輸出結果。

#### (b) Division Hardware: 
採用Third Version Sequential Restoring Division Hardware設計32-bits無號數除法Sequential Restoring Division Hardware。此版本省略了商數暫存器，由於被除數和商數左移速度相同，為簡化硬體和暫存器數量，於是將商數暫存器整合到餘數暫存器裡的最低32位元(右半部)。

#### (c) Shifters: 
以Data Flow Modeling(Continuous Assignments)設計 32-bits Barrel Shifter，完成邏輯左移運算。總共需要設計出五層，每層32個2對1多工器，共計160個2對1多工器來實現Shifter的功能。

#### (d) HiLo 暫存器: 
Hi-Lo暫存器為64-bit之特殊暫存器，有別於一般MIPS的32-bit暫存器，解決了乘除法過程中，需要用到64-bit暫存器的困境，此方法可以避免指令及擴充，以及避免R-type指令需要定址2個暫存器。
除法器計算完後，將Quotient 存於 Lo 暫存器，Remainder 存放於 Hi.暫存器。
將除法器得到的結果分為Hi、Lo(32位元)輸出，需與clk訊號同步。

#### (e) Mux:多工器: 
以Dataflow Modeling設計。因此使用(?:)條件判斷，做出if-else和case選擇的動作。

#### (f) ALU Control: 
根據輸入的6-bit控制訊號，決定該完成AND, OR, ADD, SUB, SLT, SLL, DIVU哪一種運算，須與Clock訊號同步。控制訊號與功能對應如下：

### 4.	MEM:
(1)	根據控制訊號決定是否要讀出或寫入Memory。

(2)	判斷brunch和Zero是否皆為1，若皆為1，則滿足brunch的條件，可控制下一個讀入的指令位址為PC+4+(立即值右移2的數值)。

### 5.	WB:
(1)	根據各指令所給定的控制訊號，決定MemtoReg的輸出為Total ALU的輸出或Memory的輸出，並將結果傳至WDMUX。

### 6.	Testbench:
為所設計之模組之測試平台，須以讀檔的方式讀入測試資料，以驗證所設計之模組的功能正確性。原本的Single Cycle為#10一個cycle，而Pipeline CPU會將執行階段切成五段，所以clk改為#2取一次posedge。



