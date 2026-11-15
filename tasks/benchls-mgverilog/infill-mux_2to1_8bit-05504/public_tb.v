// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05504 dut (
    .w_bus_mux_in_0(in_vec[16:9]),
    .w_bus_mux_in_1(in_vec[8:1]),
    .w_channel(in_vec[0:0]),
    .w_bus_mux_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h113b4;
    stim[1] = 17'h1561f;
    stim[2] = 17'h0c8b6;
    stim[3] = 17'h06925;
    stim[4] = 17'h16359;
    stim[5] = 17'h0f3db;
    stim[6] = 17'h1beef;
    stim[7] = 17'h062e0;
    stim[8] = 17'h1f8dc;
    stim[9] = 17'h1886a;
    stim[10] = 17'h018eb;
    stim[11] = 17'h1bb63;
    stim[12] = 17'h07041;
    stim[13] = 17'h1594a;
    stim[14] = 17'h05265;
    stim[15] = 17'h1c638;
    stim[16] = 17'h10fd4;
    stim[17] = 17'h01714;
    stim[18] = 17'h1f278;
    stim[19] = 17'h1911b;
    stim[20] = 17'h02abb;
    stim[21] = 17'h14c48;
    stim[22] = 17'h0025f;
    stim[23] = 17'h17f09;
    stim[24] = 17'h10f9b;
    stim[25] = 17'h09a9e;
    stim[26] = 17'h19c46;
    stim[27] = 17'h0f373;
    stim[28] = 17'h0ce44;
    stim[29] = 17'h146f7;
    stim[30] = 17'h0add5;
    stim[31] = 17'h04d15;
    stim[32] = 17'h1e75a;
    stim[33] = 17'h18641;
    stim[34] = 17'h00ea6;
    stim[35] = 17'h0a4ce;
    stim[36] = 17'h18408;
    stim[37] = 17'h007f5;
    stim[38] = 17'h159e2;
    stim[39] = 17'h1f009;
    stim[40] = 17'h167ad;
    stim[41] = 17'h0540f;
    stim[42] = 17'h09508;
    stim[43] = 17'h1a79e;
    stim[44] = 17'h01323;
    stim[45] = 17'h0913b;
    stim[46] = 17'h05e21;
    stim[47] = 17'h1c82f;
    stim[48] = 17'h065f8;
    stim[49] = 17'h079c2;
    stim[50] = 17'h17382;
    stim[51] = 17'h1a45e;
    stim[52] = 17'h19d07;
    stim[53] = 17'h0d8a8;
    stim[54] = 17'h181a9;
    stim[55] = 17'h1565f;
    stim[56] = 17'h0d500;
    stim[57] = 17'h02ad9;
    stim[58] = 17'h0eead;
    stim[59] = 17'h1dfb2;
    stim[60] = 17'h1130d;
    stim[61] = 17'h139fc;
    stim[62] = 17'h1fb77;
    stim[63] = 17'h0a4a4;
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
      expv[0] = 8'h89;
      expv[1] = 8'h0f;
      expv[2] = 8'h64;
      expv[3] = 8'h92;
      expv[4] = 8'hac;
      expv[5] = 8'hed;
      expv[6] = 8'h77;
      expv[7] = 8'h31;
      expv[8] = 8'hfc;
      expv[9] = 8'hc4;
      expv[10] = 8'h75;
      expv[11] = 8'hb1;
      expv[12] = 8'h20;
      expv[13] = 8'hac;
      expv[14] = 8'h32;
      expv[15] = 8'he3;
      expv[16] = 8'h87;
      expv[17] = 8'h0b;
      expv[18] = 8'hf9;
      expv[19] = 8'h8d;
      expv[20] = 8'h5d;
      expv[21] = 8'ha6;
      expv[22] = 8'h2f;
      expv[23] = 8'h84;
      expv[24] = 8'hcd;
      expv[25] = 8'h4d;
      expv[26] = 8'hce;
      expv[27] = 8'hb9;
      expv[28] = 8'h67;
      expv[29] = 8'h7b;
      expv[30] = 8'hea;
      expv[31] = 8'h8a;
      expv[32] = 8'hf3;
      expv[33] = 8'h20;
      expv[34] = 8'h07;
      expv[35] = 8'h52;
      expv[36] = 8'hc2;
      expv[37] = 8'hfa;
      expv[38] = 8'hac;
      expv[39] = 8'h04;
      expv[40] = 8'hd6;
      expv[41] = 8'h07;
      expv[42] = 8'h4a;
      expv[43] = 8'hd3;
      expv[44] = 8'h91;
      expv[45] = 8'h9d;
      expv[46] = 8'h10;
      expv[47] = 8'h17;
      expv[48] = 8'h32;
      expv[49] = 8'h3c;
      expv[50] = 8'hb9;
      expv[51] = 8'hd2;
      expv[52] = 8'h83;
      expv[53] = 8'h6c;
      expv[54] = 8'hd4;
      expv[55] = 8'h2f;
      expv[56] = 8'h6a;
      expv[57] = 8'h6c;
      expv[58] = 8'h56;
      expv[59] = 8'hef;
      expv[60] = 8'h86;
      expv[61] = 8'h9c;
      expv[62] = 8'hbb;
      expv[63] = 8'h52;
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
