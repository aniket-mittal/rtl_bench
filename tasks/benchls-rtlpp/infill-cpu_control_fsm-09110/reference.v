module rtlpp_09110(
  input clk, 
  input reset,
  input [15:0] IR, 
  input N, 
  input Z, 
  input C, 
  output reg [2:0] W_Adr, 
  output reg [2:0] R_Adr, 
  output reg [2:0] S_Adr, 
  output reg adr_sel, 
  output reg s_sel, 
  output reg pc_ld, 
  output reg pc_inc, 
  output reg pc_sel, 
  output reg ir_ld, 
  output reg mw_en, 
  output reg rw_en, 
  output reg [3:0] alu_op, 
  output reg [7:0] status
);

  reg [4:0] state; 
  reg [4:0] nextstate; 
  reg ps_N, ps_Z, ps_C; 
  reg ns_N, ns_Z, ns_C; 

  parameter RESET = 0, FETCH = 1, DECODE = 2, 
            ADD = 3, SUB = 4, CMP = 5, MOV = 6, 
            INC = 7, DEC = 8, SHL = 9, SHR = 10, 
            LD = 11, STO = 12, LDI = 13, 
            JE = 14, JNE = 15, JC = 16, JMP = 17, 
            HALT = 18, ILLEGAL_OP = 31;

  always @ (posedge clk or posedge reset) begin
    if (reset)
      state <= RESET;
    else
      state <= nextstate;
  end

  always @ (posedge clk or posedge reset) begin
    if (reset)
      {ps_N, ps_Z, ps_C} <= 3'b0;
    else
      {ps_N, ps_Z, ps_C} <= {ns_N, ns_Z, ns_C};
  end

  always @(state) begin
    case (state)    
      RESET: begin
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0; 
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0; 
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000; 
        {ns_N, ns_Z, ns_C} = 3'b0; 
        status = 8'hFF; 
        nextstate = FETCH;
      end

      FETCH: begin
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b1; pc_sel = 1'b0; ir_ld = 1'b1;  
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = 8'h80;
        nextstate = DECODE; 
      end

      DECODE: begin
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;  
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C}; 
        status = 8'hC0;
        case (IR[15:9]) 
          7'h70: nextstate = ADD;
          7'h71: nextstate = SUB;
          7'h72: nextstate = CMP;
          7'h73: nextstate = MOV;
          7'h74: nextstate = SHL;
          7'h75: nextstate = SHR;
          7'h76: nextstate = INC;
          7'h77: nextstate = DEC;
          7'h78: nextstate = LD;
          7'h79: nextstate = STO;
          7'h7A: nextstate = LDI;
          7'h7B: nextstate = HALT;
          7'h7C: nextstate = JE;
          7'h7D: nextstate = JNE;
          7'h7E: nextstate = JC;
          7'h7F: nextstate = JMP;
          default: nextstate = ILLEGAL_OP;
        endcase
      end
      
      ADD: begin
        W_Adr = IR[8:6]; R_Adr = IR[5:3]; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0100;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00000};
        nextstate = FETCH; 
      end

      SUB: begin 
        W_Adr = IR[8:6]; R_Adr = IR[5:3]; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0101;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00001};  
        nextstate = FETCH; 
      end
      
      CMP: begin 
        W_Adr = 3'b000;  R_Adr = IR[5:3]; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0101;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00010};
        nextstate = FETCH; 
      end

      MOV: begin 
        W_Adr = IR[8:6]; R_Adr = 3'b000; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};    
        status = {ps_N, ps_Z, ps_C, 5'b00011}; 
        nextstate = FETCH; 
      end
      
      SHL: begin 
        W_Adr = IR[8:6]; R_Adr = 3'b000; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0111;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00100};
        nextstate = FETCH; 
      end 
    
      SHR: begin 
        W_Adr = IR[8:6]; R_Adr = 3'b000; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0110;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00101};
        nextstate = FETCH; 
      end 
      
      INC: begin 
        W_Adr = IR[8:6]; R_Adr = 3'b000; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0010;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00110};
        nextstate = FETCH; 
      end 
    
      DEC: begin 
        W_Adr = IR[8:6]; R_Adr = 3'b000; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0011;
        {ns_N, ns_Z, ns_C} = {N, Z, C};
        status = {ps_N, ps_Z, ps_C, 5'b00111};
        nextstate = FETCH;  
      end 

      LD: begin 
        W_Adr = IR[8:6]; R_Adr = IR[2:0]; S_Adr = 3'b000;
        adr_sel = 1'b1; s_sel = 1'b1;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01000};
        nextstate = FETCH; 
      end 
      
      STO: begin 
        W_Adr = 3'b000; R_Adr = IR[8:6]; S_Adr = IR[2:0];
        adr_sel = 1'b1; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b1; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01001};
        nextstate = FETCH; 
      end 
    
      LDI: begin 
        W_Adr = IR[8:6]; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b1;
        pc_ld = 1'b0; pc_inc = 1'b1; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b1; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01010};
        nextstate = FETCH; 
      end 
    
      JE: begin 
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = ps_Z; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01100};
        nextstate = FETCH; 
      end 
      
      JNE: begin 
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = !ps_Z; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01101};
        nextstate = FETCH;  
      end
  
      JC: begin 
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = ps_C; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01110};
        nextstate = FETCH;  
      end
      
      JMP: begin 
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = IR[2:0];
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b1; pc_inc = 1'b0; pc_sel  = 1'b1; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C};
        status = {ps_N, ps_Z, ps_C, 5'b01111};
        nextstate = FETCH;  
      end
      
      HALT: begin 
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = 3'b0; 
        status = {ps_N, ps_Z, ps_C, 5'b01011}; 
        nextstate = HALT;
      end
    
      ILLEGAL_OP: begin 
        W_Adr = 3'b000; R_Adr = 3'b000; S_Adr = 3'b000;
        adr_sel = 1'b0; s_sel = 1'b0;
        pc_ld = 1'b0; pc_inc = 1'b0; pc_sel = 1'b0; ir_ld = 1'b0;
        mw_en = 1'b0; rw_en = 1'b0; alu_op = 4'b0000;
        {ns_N, ns_Z, ns_C} = 3'b0;
        status = 8'hF0;
        nextstate = ILLEGAL_OP;
      end
    endcase
  end
endmodule