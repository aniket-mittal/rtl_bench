// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220867 dut (
    .BIT_CLK(clk),
    .slots0(in_vec[99:80]),
    .slots1(in_vec[79:60]),
    .slots2(in_vec[59:40]),
    .slots3(in_vec[39:20]),
    .slots4(in_vec[19:0]),
    .SYNC(out_vec[10:10]),
    .SDATA_OUT(out_vec[9:9]),
    .RESET(out_vec[8:8]),
    .frameCount(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h1bcbdf8060152732d57eebb44;
    stim[1] = 100'h86977497548822df269de7195;
    stim[2] = 100'h5755f494393e5bba5fd71b806;
    stim[3] = 100'h4c638c9ecb86ca5e61f66cdd3;
    stim[4] = 100'h855e9ed35e37979c455de1730;
    stim[5] = 100'hb29300efc7093f84059d886cd;
    stim[6] = 100'h1bdf02c5cce6d693b6b3548fa;
    stim[7] = 100'h28078d16e4caf4b85ed015727;
    stim[8] = 100'h2029418372ca09f2dbfd04eb8;
    stim[9] = 100'h4bdab75742167cff94247fce5;
    stim[10] = 100'h191e89928271f0d3096c003a1;
    stim[11] = 100'h3db9405703873d65a03929060;
    stim[12] = 100'h02a8d52692a7c11ff12a5b742;
    stim[13] = 100'ha56495fc1358d6eb0ab6c649f;
    stim[14] = 100'h1b0d04a831fd1693bd8fe3ec7;
    stim[15] = 100'hca219c26417bbe77164050462;
    stim[16] = 100'he63e1e03c9d066b14c514f075;
    stim[17] = 100'h577bb58170fbe48fc2a8af6da;
    stim[18] = 100'h93811cdecf1781eb7a3b389a8;
    stim[19] = 100'h99d1bcfb465b7a5d493b0c176;
    stim[20] = 100'h550dfe77bd12cabe5296468e6;
    stim[21] = 100'hb663c253100bf37bf8a4adc16;
    stim[22] = 100'h04c3e460137e45dd5df18b19f;
    stim[23] = 100'h3843d90c299bab1597ea52b9f;
    stim[24] = 100'h29569121531a65dc0371b6dd4;
    stim[25] = 100'h0d0bcbb0572de508dacdaa82b;
    stim[26] = 100'ha15618dd74abff9c54d0a3d86;
    stim[27] = 100'h82d5f7077c322fc02eb185b2f;
    stim[28] = 100'h83289bd15254ddcb4ae1eb04e;
    stim[29] = 100'hf0775cae2315b74cacdb79663;
    stim[30] = 100'h21675c827adbd295b4acfbecf;
    stim[31] = 100'h01321f276bb6a65b9e3d89101;
    stim[32] = 100'hccef6e2631b5d8de04c3e9240;
    stim[33] = 100'hfba13a53e8e44dbfc5927458d;
    stim[34] = 100'h1f5e368b2cae17854dbdc985a;
    stim[35] = 100'h6addce05defafb9df5cf98c23;
    stim[36] = 100'he6ea8c4cbabd748c01d83e05e;
    stim[37] = 100'ha434abffc11ec086676b88560;
    stim[38] = 100'h4947e62f2f74e3124efc7e9eb;
    stim[39] = 100'h165294b49d55f7daabe5e35db;
    stim[40] = 100'h5f3755050f4fe0a1e13b2e7ac;
    stim[41] = 100'haff01557121bdb2f679ca1cb7;
    stim[42] = 100'ha5ee6befe4da488603f309bc7;
    stim[43] = 100'h9f5ce9e204d11d6d68ab5c6fd;
    stim[44] = 100'hcb4c37e6fa2c7af1bdc3ec653;
    stim[45] = 100'hd3cde6686b2d927735b9a994a;
    stim[46] = 100'h94f7eee9627be27760296c058;
    stim[47] = 100'h6aa5b4bfc7b73d306a11f5e27;
    stim[48] = 100'h2c64dfb56b8abf325c16ff21d;
    stim[49] = 100'ha949b7e7f715e264ef4ce6899;
    stim[50] = 100'h64e8251dbf37bb825e2558ffa;
    stim[51] = 100'hfe7c23cac2dc73f417527f600;
    stim[52] = 100'h1bc3c2e4fbe67b30de60c2d99;
    stim[53] = 100'hf06ed695b234c43a450a398f6;
    stim[54] = 100'hf4ed4ae2def5394168731e31f;
    stim[55] = 100'h34a4992ae09c62afcc5c0cea1;
    stim[56] = 100'h0afb264c25afc60dc848b0336;
    stim[57] = 100'hff3c0b6cdc35128bec7e49b6f;
    stim[58] = 100'h1c76392f9860aec9580a2e3e6;
    stim[59] = 100'ha3b8e767fbcbd51dea6953d9c;
    stim[60] = 100'h7db07bc253c22ebd7b5ec4c9f;
    stim[61] = 100'h28f605989b490b95528cf8010;
    stim[62] = 100'h3558f796e7018f6c6475b924f;
    stim[63] = 100'h28bb7cc02e1e4099f34b19f0c;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 11'hx00;
      expv[1] = 11'hx00;
      expv[2] = 11'hx00;
      expv[3] = 11'hx00;
      expv[4] = 11'hx00;
      expv[5] = 11'hx00;
      expv[6] = 11'hx00;
      expv[7] = 11'hx00;
      expv[8] = 11'hx00;
      expv[9] = 11'hx00;
      expv[10] = 11'hx00;
      expv[11] = 11'hx00;
      expv[12] = 11'hx00;
      expv[13] = 11'hx00;
      expv[14] = 11'hx00;
      expv[15] = 11'hx00;
      expv[16] = 11'h200;
      expv[17] = 11'h200;
      expv[18] = 11'h000;
      expv[19] = 11'h200;
      expv[20] = 11'h000;
      expv[21] = 11'h200;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h200;
      expv[26] = 11'h000;
      expv[27] = 11'h200;
      expv[28] = 11'h000;
      expv[29] = 11'h200;
      expv[30] = 11'h200;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h200;
      expv[35] = 11'h200;
      expv[36] = 11'h200;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h200;
      expv[41] = 11'h000;
      expv[42] = 11'h200;
      expv[43] = 11'h000;
      expv[44] = 11'h200;
      expv[45] = 11'h200;
      expv[46] = 11'h000;
      expv[47] = 11'h200;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h200;
      expv[52] = 11'h200;
      expv[53] = 11'h000;
      expv[54] = 11'h200;
      expv[55] = 11'h200;
      expv[56] = 11'h200;
      expv[57] = 11'h000;
      expv[58] = 11'h200;
      expv[59] = 11'h000;
      expv[60] = 11'h200;
      expv[61] = 11'h200;
      expv[62] = 11'h000;
      expv[63] = 11'h200;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
