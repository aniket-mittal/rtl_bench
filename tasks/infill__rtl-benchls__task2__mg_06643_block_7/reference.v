module mg_06643 (input wire iClock,input wire iReset,input wire iOsc64,input wire iOsc256,input wire iOsc262k,input wire [7:0] iNR21,input wire [7:0] iNR22,input wire [7:0] iNR23,input wire [7:0] iNR24,output reg [4:0] oOut,output wire oOnFlag);
reg [5:0] rLength; 
  reg [19:0] rLengthCounter; 
  reg [1:0] rDutyCycle; 
  reg rTimedMode; 
  reg rLengthComplete; 
  reg rTone; 
  reg [10:0] rSoundFrequency; 
  reg [10:0] rSoundFrequencyCounter; 
  reg [3:0] rStep; 
  reg [18:0] rStepTime; 
  reg [18:0] rStepCounter; 
  reg [3:0] rInitialValue; 
  reg rEvelopeMode; 
  wire [4:0] up_value, down_value; 
  always @(posedge iClock) begin 
  if (iReset || iNR24[7]) begin 
  rLength <= iNR21[5:0]; 
  rLengthCounter <= 64-iNR21[5:0]; 
  rLengthComplete <= 0; 
  rDutyCycle <= iNR21[7:6]; 
  rTimedMode <= iNR24[6]; 
  rStepTime <= iNR22[2:0]; 
  rStepCounter <= iNR22[2:0]; 
  rEvelopeMode <= iNR22[3]; 
  rInitialValue <= iNR22[7:4]; 
  rStep <= iNR22[7:4]; 
  rTone <= 0; 
  rSoundFrequency[7:0] <= iNR23[7:0]; 
  rSoundFrequency[10:8] <= iNR24[2:0]; 
  rSoundFrequencyCounter <= 2048-{iNR24[2:0],iNR23[7:0]}; 
  end 
  end 
  always @(posedge iOsc64) begin 
  if (rStepTime != 0) begin 
  if (rStepCounter ==1 ) begin 
  rStepCounter <= rStepTime; 
  if(rEvelopeMode) begin 
  rStep <= ((rStep == 4'hF) ? rStep : rStep+1); 
  end 
  else begin 
  rStep <= ((rStep == 4'h0) ? rStep : rStep-1); 
  end 
  end 
  else begin 
  rStepCounter <= rStepCounter-1; 
  end 
  end 
  end 
  always @(posedge iOsc262k) begin 
  if (rSoundFrequencyCounter ==0) begin 
  rSoundFrequencyCounter <= 2048-rSoundFrequency; 
  rTone <= ~rTone; 
  end 
  else begin 
  rSoundFrequencyCounter <= rSoundFrequencyCounter-1; 
  end 
  end 
  always @(posedge iOsc256) begin 
  if (rLengthCounter == 0) begin 
  rLengthCounter <= 64-rLength; 
  rLengthComplete <= rTimedMode; 
  end 
  else begin 
  rLengthCounter <= rLengthCounter-1; 
  end 
  end 
  assign up_value = 5'd15 + rStep; 
  assign down_value = 5'd15 - rStep; 
  always @(posedge iClock) begin 
  if (rLengthComplete) begin 
  oOut[4:0] <= 5'd15; 
  end 
  else begin 
  if (rTone) begin 
  oOut[4:0] <= up_value[4:0]; 
  end 
  else begin 
  oOut[4:0] <= down_value[4:0]; 
  end 
  end 
  end 
 assign oOnFlag = rLengthComplete; 
 endmodule