// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  logical_tile_clb_mode_clb_ dut (
    .clk(clk),
    .pReset(in_vec[45:45]),
    .prog_clk(in_vec[44:44]),
    .set(in_vec[43:43]),
    .reset(in_vec[42:42]),
    .clb_I(in_vec[41:2]),
    .clb_clk(in_vec[1:1]),
    .ccff_head(in_vec[0:0]),
    .clb_O(out_vec[20:1]),
    .ccff_tail(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h161f5dd0bea6;
    stim[1] = 46'h256786978834;
    stim[2] = 46'h288bb2ceb0c1;
    stim[3] = 46'h3905b3521180;
    stim[4] = 46'h325621d26e64;
    stim[5] = 46'h12cba25acc9b;
    stim[6] = 46'h20870991f305;
    stim[7] = 46'h33dbd2fc9b3b;
    stim[8] = 46'h186b23b6f6a0;
    stim[9] = 46'h32f1747b46df;
    stim[10] = 46'h2184e1db9f5d;
    stim[11] = 46'h1894fceffc3a;
    stim[12] = 46'h2beac7bc81d8;
    stim[13] = 46'h12598297cd30;
    stim[14] = 46'h2827e964dcc6;
    stim[15] = 46'h3ac4c0cc4ac2;
    stim[16] = 46'h107c0b36cfb0;
    stim[17] = 46'h0ac6c91676f0;
    stim[18] = 46'h00b8a53b87d3;
    stim[19] = 46'h2bd6e54254c5;
    stim[20] = 46'h081435672883;
    stim[21] = 46'h1980ff553a1c;
    stim[22] = 46'h0a795fda76f3;
    stim[23] = 46'h1b40f79faae7;
    stim[24] = 46'h2a6560acda9c;
    stim[25] = 46'h19c48da6240f;
    stim[26] = 46'h2957f0514a53;
    stim[27] = 46'h21f5196100c2;
    stim[28] = 46'h10e8cf3a2766;
    stim[29] = 46'h0a293608a3c9;
    stim[30] = 46'h13e9de16dc0f;
    stim[31] = 46'h19429b62353c;
    stim[32] = 46'h1b65dfe15647;
    stim[33] = 46'h2a7b97a4a279;
    stim[34] = 46'h212dc47970c2;
    stim[35] = 46'h01205fab51d8;
    stim[36] = 46'h2931d7cf0190;
    stim[37] = 46'h3a918c9bb7f5;
    stim[38] = 46'h33185366958a;
    stim[39] = 46'h09274c968e17;
    stim[40] = 46'h2ae87b9cb7ae;
    stim[41] = 46'h31bb4c7add2b;
    stim[42] = 46'h39b432a62514;
    stim[43] = 46'h12d77a45d39a;
    stim[44] = 46'h2aefbe26fcc1;
    stim[45] = 46'h0be146a5e659;
    stim[46] = 46'h39b2dc9784f5;
    stim[47] = 46'h09b9ac302cc3;
    stim[48] = 46'h03ca267be9e1;
    stim[49] = 46'h2b2bfcd620ee;
    stim[50] = 46'h104885916ed3;
    stim[51] = 46'h04a22ef8885e;
    stim[52] = 46'h23ae704ee867;
    stim[53] = 46'h035bc8ebde2f;
    stim[54] = 46'h100db8b0da7a;
    stim[55] = 46'h30375ff2338d;
    stim[56] = 46'h3b6b5a9ec8af;
    stim[57] = 46'h1274b26ff48c;
    stim[58] = 46'h2a61a6015813;
    stim[59] = 46'h19cf450e5c16;
    stim[60] = 46'h28debdd24672;
    stim[61] = 46'h238a9ef0eb8b;
    stim[62] = 46'h31e7b36584ec;
    stim[63] = 46'h33718aa55950;
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
      expv[0] = 21'h085f52;
      expv[1] = 21'h0bc41a;
      expv[2] = 21'h075861;
      expv[3] = 21'h0908c0;
      expv[4] = 21'h093732;
      expv[5] = 21'h0d664d;
      expv[6] = 21'h08f983;
      expv[7] = 21'h1e4d9d;
      expv[8] = 21'h1b7b50;
      expv[9] = 21'h1da36f;
      expv[10] = 21'h0dcfaf;
      expv[11] = 21'h17fe1c;
      expv[12] = 21'h1e40ec;
      expv[13] = 21'h0be698;
      expv[14] = 21'h126e62;
      expv[15] = 21'h062560;
      expv[16] = 21'h1b67d8;
      expv[17] = 21'h0b3b78;
      expv[18] = 21'h1dc3e9;
      expv[19] = 21'h012a63;
      expv[20] = 21'h139441;
      expv[21] = 21'h0a9d0e;
      expv[22] = 21'h0d3b79;
      expv[23] = 21'h0fd573;
      expv[24] = 21'h166d4e;
      expv[25] = 21'h131207;
      expv[26] = 21'h08a529;
      expv[27] = 21'h108060;
      expv[28] = 21'h1d13b2;
      expv[29] = 21'h0451e5;
      expv[30] = 21'h0b6e07;
      expv[31] = 21'h111a9e;
      expv[32] = 21'h10ab23;
      expv[33] = 21'h12513d;
      expv[34] = 21'h1cb860;
      expv[35] = 21'h15a8ec;
      expv[36] = 21'h0780c8;
      expv[37] = 21'h0ddbfb;
      expv[38] = 21'h134ac4;
      expv[39] = 21'h0b470b;
      expv[40] = 21'h0e5bd6;
      expv[41] = 21'h1d6e95;
      expv[42] = 21'h13128a;
      expv[43] = 21'h02e9cc;
      expv[44] = 21'h137e61;
      expv[45] = 21'h12f32d;
      expv[46] = 21'h0bc27b;
      expv[47] = 21'h181661;
      expv[48] = 21'h1df4f1;
      expv[49] = 21'h0b1076;
      expv[50] = 21'h08b769;
      expv[51] = 21'h1c442e;
      expv[52] = 21'h077433;
      expv[53] = 21'h15ef17;
      expv[54] = 21'h186d3c;
      expv[55] = 21'h1919c7;
      expv[56] = 21'h0f6457;
      expv[57] = 21'h17fa46;
      expv[58] = 21'h00ac09;
      expv[59] = 21'h072e0a;
      expv[60] = 21'h092338;
      expv[61] = 21'h1875c5;
      expv[62] = 21'h12c276;
      expv[63] = 21'h12aca8;
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
