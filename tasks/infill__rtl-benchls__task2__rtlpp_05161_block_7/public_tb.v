// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05161 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[47:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1493244b89;
    stim[1] = 37'h1da44058ab;
    stim[2] = 37'h12642cf75d;
    stim[3] = 37'h1b76b84338;
    stim[4] = 37'h12a209c8ac;
    stim[5] = 37'h0e22da232c;
    stim[6] = 37'h0baad3dd6f;
    stim[7] = 37'h0e4cc8a47a;
    stim[8] = 37'h13909fbc44;
    stim[9] = 37'h1f989e8be9;
    stim[10] = 37'h13b25e7cf6;
    stim[11] = 37'h06c29561a4;
    stim[12] = 37'h12f0db752d;
    stim[13] = 37'h12de698492;
    stim[14] = 37'h03c7ad4ea8;
    stim[15] = 37'h1b3efe4ba6;
    stim[16] = 37'h0e7a90fd34;
    stim[17] = 37'h1ed70d13b2;
    stim[18] = 37'h03b72a3aec;
    stim[19] = 37'h1f5359545d;
    stim[20] = 37'h1e31ce0206;
    stim[21] = 37'h16797426f0;
    stim[22] = 37'h0648edd079;
    stim[23] = 37'h13c077d110;
    stim[24] = 37'h170071dcef;
    stim[25] = 37'h163ddc2bae;
    stim[26] = 37'h0a3c1de004;
    stim[27] = 37'h0e9c97e16d;
    stim[28] = 37'h0658809d86;
    stim[29] = 37'h02f320e491;
    stim[30] = 37'h1ff8d82b22;
    stim[31] = 37'h0f6622cbc1;
    stim[32] = 37'h023195bd4a;
    stim[33] = 37'h1787818349;
    stim[34] = 37'h0afbf1156f;
    stim[35] = 37'h170817490a;
    stim[36] = 37'h13d428d0c3;
    stim[37] = 37'h1fe3f13707;
    stim[38] = 37'h078cac2bad;
    stim[39] = 37'h0717e966e5;
    stim[40] = 37'h0fb32e1e43;
    stim[41] = 37'h06918bd452;
    stim[42] = 37'h13c4701621;
    stim[43] = 37'h1b4bb03d42;
    stim[44] = 37'h1a0e842a06;
    stim[45] = 37'h0622add71b;
    stim[46] = 37'h1ae2703d06;
    stim[47] = 37'h0fe3a77033;
    stim[48] = 37'h171f064ae7;
    stim[49] = 37'h1aa28502c9;
    stim[50] = 37'h1fcf2329b8;
    stim[51] = 37'h12dae9f3fc;
    stim[52] = 37'h17100f51b0;
    stim[53] = 37'h03fe24a97c;
    stim[54] = 37'h06dff7fe76;
    stim[55] = 37'h1734d3a162;
    stim[56] = 37'h0f58141e07;
    stim[57] = 37'h03764b5f37;
    stim[58] = 37'h1e2c0c1bc3;
    stim[59] = 37'h1e0a3155a2;
    stim[60] = 37'h1b43071832;
    stim[61] = 37'h17ada0cff0;
    stim[62] = 37'h1a834abab1;
    stim[63] = 37'h038e8cb5ab;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h000000000000;
      expv[12] = 48'h61a400000000;
      expv[13] = 48'h61a400000000;
      expv[14] = 48'h61a4000061a4;
      expv[15] = 48'h61a400000000;
      expv[16] = 48'h61a400000000;
      expv[17] = 48'h61a400000000;
      expv[18] = 48'h61a4000061a4;
      expv[19] = 48'h61a400000000;
      expv[20] = 48'h61a400000000;
      expv[21] = 48'h61a400000000;
      expv[22] = 48'h61a4000061a4;
      expv[23] = 48'hd07900000000;
      expv[24] = 48'hd07900000000;
      expv[25] = 48'hd07900000000;
      expv[26] = 48'hd07900000000;
      expv[27] = 48'hd07900000000;
      expv[28] = 48'hd0790000d079;
      expv[29] = 48'h9d8600009d86;
      expv[30] = 48'h9d8600000000;
      expv[31] = 48'h9d8600000000;
      expv[32] = 48'h9d8600009d86;
      expv[33] = 48'h9d8600000000;
      expv[34] = 48'h9d8600000000;
      expv[35] = 48'h9d8600000000;
      expv[36] = 48'h9d8600000000;
      expv[37] = 48'h9d8600000000;
      expv[38] = 48'h9d8600009d86;
      expv[39] = 48'h9d8600009d86;
      expv[40] = 48'h9d8600000000;
      expv[41] = 48'h9d8600009d86;
      expv[42] = 48'hd45200000000;
      expv[43] = 48'hd45200000000;
      expv[44] = 48'hd45200000000;
      expv[45] = 48'hd4520000d452;
      expv[46] = 48'hd71b00000000;
      expv[47] = 48'hd71b00000000;
      expv[48] = 48'hd71b00000000;
      expv[49] = 48'hd71b00000000;
      expv[50] = 48'hd71b00000000;
      expv[51] = 48'hd71b00000000;
      expv[52] = 48'hd71b00000000;
      expv[53] = 48'hd71b0000d71b;
      expv[54] = 48'hd71b0000d71b;
      expv[55] = 48'hfe7600000000;
      expv[56] = 48'hfe7600000000;
      expv[57] = 48'hfe760000fe76;
      expv[58] = 48'hfe7600000000;
      expv[59] = 48'hfe7600000000;
      expv[60] = 48'hfe7600000000;
      expv[61] = 48'hfe7600000000;
      expv[62] = 48'hfe7600000000;
      expv[63] = 48'hfe760000fe76;
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
