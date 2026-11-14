module dut
(
  input ring,
  input vibrate_mode,
  output ringer,
  output motor
);

  assign ringer = vibrate_mode & ~ring;
  assign motor = ring & vibrate_mode;

endmodule
