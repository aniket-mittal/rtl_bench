// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  adder_16bit dut (
    .a(in_vec[32:17]),
    .b(in_vec[16:1]),
    .Cin(in_vec[0:0]),
    .y(out_vec[16:1]),
    .Co(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0413f9d65;
    stim[1] = 33'h1f0534f94;
    stim[2] = 33'h0d39cae71;
    stim[3] = 33'h05700082c;
    stim[4] = 33'h1a244655b;
    stim[5] = 33'h163137cdc;
    stim[6] = 33'h0aa92cf73;
    stim[7] = 33'h1ff80ad36;
    stim[8] = 33'h1bec51302;
    stim[9] = 33'h082710323;
    stim[10] = 33'h16865d16e;
    stim[11] = 33'h10d61ccfd;
    stim[12] = 33'h10606c13e;
    stim[13] = 33'h0cda57090;
    stim[14] = 33'h06c29245b;
    stim[15] = 33'h01c10e596;
    stim[16] = 33'h1c4a50592;
    stim[17] = 33'h1c05b24b8;
    stim[18] = 33'h180c134e7;
    stim[19] = 33'h19a61b181;
    stim[20] = 33'h0f1dd43a8;
    stim[21] = 33'h14206351f;
    stim[22] = 33'h1d4e252fc;
    stim[23] = 33'h0db8fbafc;
    stim[24] = 33'h192676dd8;
    stim[25] = 33'h1a6ceb8fe;
    stim[26] = 33'h1b7d3c796;
    stim[27] = 33'h0e8e833b5;
    stim[28] = 33'h1d4820930;
    stim[29] = 33'h1ee89d570;
    stim[30] = 33'h096e3ca31;
    stim[31] = 33'h047ed9f28;
    stim[32] = 33'h1354a3829;
    stim[33] = 33'h067197df6;
    stim[34] = 33'h1638c73f7;
    stim[35] = 33'h1ecd4ce14;
    stim[36] = 33'h01093effc;
    stim[37] = 33'h146612abb;
    stim[38] = 33'h1a21fc868;
    stim[39] = 33'h1d9226a78;
    stim[40] = 33'h123dd308a;
    stim[41] = 33'h0cbde3cad;
    stim[42] = 33'h023577e4f;
    stim[43] = 33'h0c875ef1c;
    stim[44] = 33'h02c3ab502;
    stim[45] = 33'h1f50ea14b;
    stim[46] = 33'h15f7bb7c7;
    stim[47] = 33'h1f2fec0e6;
    stim[48] = 33'h1a7b55fe4;
    stim[49] = 33'h058a8f38f;
    stim[50] = 33'h1fc5d40da;
    stim[51] = 33'h1e075e961;
    stim[52] = 33'h058007914;
    stim[53] = 33'h095710a45;
    stim[54] = 33'h199a3efd5;
    stim[55] = 33'h1e4f57d60;
    stim[56] = 33'h0851a1c4f;
    stim[57] = 33'h12234ac31;
    stim[58] = 33'h0664fe1c1;
    stim[59] = 33'h04f64c470;
    stim[60] = 33'h101a27c5e;
    stim[61] = 33'h1d137866e;
    stim[62] = 33'h1d0c14c90;
    stim[63] = 33'h1cef5b47f;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 17'h1dea4;
      expv[1] = 17'h13fe7;
      expv[2] = 17'h1820e;
      expv[3] = 17'h05f2c;
      expv[4] = 17'h007a1;
      expv[5] = 17'h0dfef;
      expv[6] = 17'h17a06;
      expv[7] = 17'h0acb7;
      expv[8] = 17'h0d1c7;
      expv[9] = 17'h18594;
      expv[10] = 17'h139d3;
      expv[11] = 17'h0da5f;
      expv[12] = 17'h1c744;
      expv[13] = 17'h03e35;
      expv[14] = 17'h19084;
      expv[15] = 17'h101a6;
      expv[16] = 17'h0ca37;
      expv[17] = 17'h0e513;
      expv[18] = 17'h0b5a9;
      expv[19] = 17'h14be3;
      expv[20] = 17'h03585;
      expv[21] = 17'h17726;
      expv[22] = 17'h027df;
      expv[23] = 17'h0968b;
      expv[24] = 17'h1003f;
      expv[25] = 17'h05fcd;
      expv[26] = 17'h17f69;
      expv[27] = 17'h11c9e;
      expv[28] = 17'h1ddb2;
      expv[29] = 17'h1c3f9;
      expv[30] = 17'h06115;
      expv[31] = 17'h1e714;
      expv[32] = 17'h16d74;
      expv[33] = 17'h1e50e;
      expv[34] = 17'h1d784;
      expv[35] = 17'h0bae9;
      expv[36] = 17'h0008f;
      expv[37] = 17'h0711d;
      expv[38] = 17'h16a87;
      expv[39] = 17'h0439b;
      expv[40] = 17'h05467;
      expv[41] = 17'h1088c;
      expv[42] = 17'h1a1a6;
      expv[43] = 17'h0b791;
      expv[44] = 17'h0e13c;
      expv[45] = 17'h0965b;
      expv[46] = 17'h11743;
      expv[47] = 17'h0b3e5;
      expv[48] = 17'h10799;
      expv[49] = 17'h14c38;
      expv[50] = 17'h13d37;
      expv[51] = 17'h1c9d7;
      expv[52] = 17'h0d114;
      expv[53] = 17'h19fb6;
      expv[54] = 17'h18979;
      expv[55] = 17'h16255;
      expv[56] = 17'h0a16a;
      expv[57] = 17'h1ce66;
      expv[58] = 17'h04811;
      expv[59] = 17'h113d4;
      expv[60] = 17'h17e00;
      expv[61] = 17'h157a5;
      expv[62] = 17'h11d51;
      expv[63] = 17'h18375;
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
