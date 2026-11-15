module autovcoder_088171 (
    Write_Files,
    File_Type,
    Write_Layer,
    SignalDecompressed,
    SignalFile,
    SignalCNN,
    SignalLayer,
    OutSignal
);

  input Write_Files, File_Type, Write_Layer;
  input SignalDecompressed, SignalFile, SignalCNN, SignalLayer;
  output OutSignal;
  integer Temp;
  reg [2:0] TempSelec;
  [MASKED]
  assign OutSignal = Temp;
endmodule

