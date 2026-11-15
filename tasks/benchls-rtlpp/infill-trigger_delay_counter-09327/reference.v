module rtlpp_09327
          (clk,
           reset,
           enb,
           triggerStart,
           suppress,
           Signal);


  input   clk;
  input   reset;
  input   enb;
  input   triggerStart;
  input   suppress;
  output  Signal;

  reg Signal;
  reg [8:0] Delay6_out1;

  wire Logical_Operator1_out1;
  wire Logical_Operator_out1;
  wire [7:0] Constant_out1;  
  wire [8:0] Constant6_out1;  
  wire [7:0] Constant5_out1;  
  wire [7:0] Switch3_out1;  
  wire [8:0] Sum_1;  
  wire [8:0] Sum_2;  
  wire [8:0] Sum_out1;  
  wire [8:0] Switch4_out1;  
  wire [7:0] Switch4_out1_dtc;  
  wire Compare_To_Constant_out1;

  assign Logical_Operator1_out1 =  ~ triggerStart;
  assign Logical_Operator_out1 = suppress & Logical_Operator1_out1;
  assign Constant_out1 = 8'b00000001;
  assign Constant6_out1 = 9'b000000001;
  assign Constant5_out1 = 8'b00000000;

  assign Sum_1 = {1'b0, Switch3_out1};
  assign Sum_2 = {1'b0, Constant_out1};
  assign Sum_out1 = Sum_1 + Sum_2;

  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 9'b000000000;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= Sum_out1;
        end
      end
    end

  assign Switch4_out1 = (triggerStart == 1'b0 ? Delay6_out1 :
              Constant6_out1);

  assign Switch4_out1_dtc = Switch4_out1[7:0];
  assign Switch3_out1 = (Logical_Operator_out1 == 1'b0 ? Switch4_out1_dtc :
              Constant5_out1);

  assign Compare_To_Constant_out1 = (Switch3_out1 == 8'b00000011);
  assign Signal = Compare_To_Constant_out1;

endmodule