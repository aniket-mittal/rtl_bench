// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05202 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[63:32]),
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
    stim[0] = 37'h1473633471;
    stim[1] = 37'h04191dfffd;
    stim[2] = 37'h06405c53e6;
    stim[3] = 37'h0f2f41d5f9;
    stim[4] = 37'h06e316f71e;
    stim[5] = 37'h132ef3d7cb;
    stim[6] = 37'h19e6784bcc;
    stim[7] = 37'h0af74931b8;
    stim[8] = 37'h1620653ad9;
    stim[9] = 37'h1af7f45323;
    stim[10] = 37'h02b74fa3ff;
    stim[11] = 37'h16395b365d;
    stim[12] = 37'h062911daf2;
    stim[13] = 37'h06680f63ad;
    stim[14] = 37'h0b7a16c852;
    stim[15] = 37'h12a7c4e017;
    stim[16] = 37'h07819b835a;
    stim[17] = 37'h1fb8573aaa;
    stim[18] = 37'h16344d0ae1;
    stim[19] = 37'h1bd556b19b;
    stim[20] = 37'h121777656b;
    stim[21] = 37'h17c5782e36;
    stim[22] = 37'h1e791966b5;
    stim[23] = 37'h03bbda1cd0;
    stim[24] = 37'h1dd331ae80;
    stim[25] = 37'h0b752c26ea;
    stim[26] = 37'h1e4b48c541;
    stim[27] = 37'h03a1e79bd6;
    stim[28] = 37'h0fc4919e0c;
    stim[29] = 37'h1d9b70a96a;
    stim[30] = 37'h06d3b3fb8a;
    stim[31] = 37'h1f96fbe443;
    stim[32] = 37'h1e52471abd;
    stim[33] = 37'h0f19382712;
    stim[34] = 37'h0607d27771;
    stim[35] = 37'h1722ad3aed;
    stim[36] = 37'h167db1a666;
    stim[37] = 37'h1379b8d89a;
    stim[38] = 37'h13d35c45f7;
    stim[39] = 37'h0ad0453717;
    stim[40] = 37'h12baf5f340;
    stim[41] = 37'h16e9cd1ed9;
    stim[42] = 37'h16619e8441;
    stim[43] = 37'h0ab8879ea1;
    stim[44] = 37'h1f4b4f3fc4;
    stim[45] = 37'h0382925112;
    stim[46] = 37'h1aca9fcb11;
    stim[47] = 37'h074294b1cd;
    stim[48] = 37'h1b7059b775;
    stim[49] = 37'h0b94bf4e77;
    stim[50] = 37'h0f71f92cb8;
    stim[51] = 37'h0e44714910;
    stim[52] = 37'h132873ee5d;
    stim[53] = 37'h1ba12438b6;
    stim[54] = 37'h1fd88ac6b7;
    stim[55] = 37'h1fa83c948f;
    stim[56] = 37'h1a43ba7f99;
    stim[57] = 37'h032f5fcb1d;
    stim[58] = 37'h1b262aaebe;
    stim[59] = 37'h0a725be660;
    stim[60] = 37'h174b7c195c;
    stim[61] = 37'h0b10a48503;
    stim[62] = 37'h06d57dd7d6;
    stim[63] = 37'h161d29bbeb;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h405c53e600000000;
      expv[4] = 64'h405c53e6405c53e6;
      expv[5] = 64'he316f71e00000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h2911daf22911daf2;
      expv[14] = 64'h680f63ad00000000;
      expv[15] = 64'h680f63ad00000000;
      expv[16] = 64'h680f63ad680f63ad;
      expv[17] = 64'h680f63ad00000000;
      expv[18] = 64'h680f63ad00000000;
      expv[19] = 64'h680f63ad00000000;
      expv[20] = 64'h680f63ad00000000;
      expv[21] = 64'h680f63ad00000000;
      expv[22] = 64'h680f63ad00000000;
      expv[23] = 64'h680f63ad680f63ad;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'hd3b3fb8a00000000;
      expv[32] = 64'hd3b3fb8a00000000;
      expv[33] = 64'hd3b3fb8a00000000;
      expv[34] = 64'hd3b3fb8ad3b3fb8a;
      expv[35] = 64'h07d2777100000000;
      expv[36] = 64'h07d2777100000000;
      expv[37] = 64'h07d2777100000000;
      expv[38] = 64'h07d2777100000000;
      expv[39] = 64'h07d2777100000000;
      expv[40] = 64'h07d2777100000000;
      expv[41] = 64'h07d2777100000000;
      expv[42] = 64'h07d2777100000000;
      expv[43] = 64'h07d2777100000000;
      expv[44] = 64'h07d2777100000000;
      expv[45] = 64'h07d2777107d27771;
      expv[46] = 64'h07d2777100000000;
      expv[47] = 64'h07d2777107d27771;
      expv[48] = 64'h07d2777100000000;
      expv[49] = 64'h07d2777100000000;
      expv[50] = 64'h07d2777100000000;
      expv[51] = 64'h07d2777100000000;
      expv[52] = 64'h07d2777100000000;
      expv[53] = 64'h07d2777100000000;
      expv[54] = 64'h07d2777100000000;
      expv[55] = 64'h07d2777100000000;
      expv[56] = 64'h07d2777100000000;
      expv[57] = 64'h07d2777107d27771;
      expv[58] = 64'h07d2777100000000;
      expv[59] = 64'h07d2777100000000;
      expv[60] = 64'h07d2777100000000;
      expv[61] = 64'h07d2777100000000;
      expv[62] = 64'h07d2777107d27771;
      expv[63] = 64'hd57dd7d600000000;
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
