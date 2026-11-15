module mg_04583 (input nReset,input clock,input [9:0] adc_databus,input testModeFlag,output [9:0] dataOut);
reg [9:0] adcData; 
 reg [9:0] testData; 
 wire [9:0] adc_databusRead; 
 assign dataOut = testModeFlag ? testData : adcData; 
 [MASKED] 
 endmodule