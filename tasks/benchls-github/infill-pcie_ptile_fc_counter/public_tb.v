// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pcie_ptile_fc_counter dut (
    .clk(clk),
    .rst(in_vec[35:35]),
    .tx_cdts_limit(in_vec[34:19]),
    .tx_cdts_limit_tdm_idx(in_vec[18:16]),
    .fc_dec(in_vec[15:0]),
    .fc_av(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hcf67c3704;
    stim[1] = 36'hff35486d7;
    stim[2] = 36'h453872244;
    stim[3] = 36'h24a33b552;
    stim[4] = 36'h7a087db1e;
    stim[5] = 36'h5c0447565;
    stim[6] = 36'h334bd1c91;
    stim[7] = 36'h235b49b0c;
    stim[8] = 36'h174481bff;
    stim[9] = 36'h758601bcf;
    stim[10] = 36'h6ec955e61;
    stim[11] = 36'h6760466c1;
    stim[12] = 36'h578927000;
    stim[13] = 36'h5749b372c;
    stim[14] = 36'h658962ef2;
    stim[15] = 36'h7537688c8;
    stim[16] = 36'h0b9768590;
    stim[17] = 36'h11759e261;
    stim[18] = 36'h417d9353e;
    stim[19] = 36'h784735b12;
    stim[20] = 36'h0f5e21a70;
    stim[21] = 36'h2f23dbe64;
    stim[22] = 36'h6e1a0760c;
    stim[23] = 36'h5e8324401;
    stim[24] = 36'h2aba93ffa;
    stim[25] = 36'h62dc3dc2e;
    stim[26] = 36'h6937060ce;
    stim[27] = 36'h0f0303919;
    stim[28] = 36'h19fa8dfc0;
    stim[29] = 36'h1334573ce;
    stim[30] = 36'h89cd56b46;
    stim[31] = 36'h263d0baa4;
    stim[32] = 36'h09f858ac6;
    stim[33] = 36'h491125e7f;
    stim[34] = 36'h76236fac0;
    stim[35] = 36'hb5b4bc5f2;
    stim[36] = 36'h3afe77eb0;
    stim[37] = 36'h4f2d81d5e;
    stim[38] = 36'h7138c78e2;
    stim[39] = 36'h32c077276;
    stim[40] = 36'h31ac2ef26;
    stim[41] = 36'h769a66153;
    stim[42] = 36'h7db5cff39;
    stim[43] = 36'h6e2bcab88;
    stim[44] = 36'h1cbfd4afb;
    stim[45] = 36'h239351132;
    stim[46] = 36'h191ced9a0;
    stim[47] = 36'h21cdb8d63;
    stim[48] = 36'h412bcdca8;
    stim[49] = 36'h267e016cd;
    stim[50] = 36'h240cc481c;
    stim[51] = 36'h0a250c60f;
    stim[52] = 36'h0a6872cb4;
    stim[53] = 36'h5cd6fb607;
    stim[54] = 36'h041bb198e;
    stim[55] = 36'h5eefa7bfa;
    stim[56] = 36'h7716e7038;
    stim[57] = 36'h419c999e6;
    stim[58] = 36'h7eaf411d4;
    stim[59] = 36'h750724b04;
    stim[60] = 36'h2fee6741b;
    stim[61] = 36'h61916f535;
    stim[62] = 36'h72e2ded78;
    stim[63] = 36'h28affbf8c;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h12ba;
      expv[11] = 16'h2e89;
      expv[12] = 16'h2e89;
      expv[13] = 16'h2e89;
      expv[14] = 16'h2e89;
      expv[15] = 16'h2e89;
      expv[16] = 16'h2e89;
      expv[17] = 16'h2e89;
      expv[18] = 16'h08ab;
      expv[19] = 16'h2e89;
      expv[20] = 16'h2e89;
      expv[21] = 16'h2e89;
      expv[22] = 16'h2ca8;
      expv[23] = 16'h2e89;
      expv[24] = 16'h2e89;
      expv[25] = 16'h2e89;
      expv[26] = 16'h2e89;
      expv[27] = 16'h2e89;
      expv[28] = 16'h2e89;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h2579;
      expv[40] = 16'h515e;
      expv[41] = 16'h0093;
      expv[42] = 16'h3d9b;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h5360;
      expv[46] = 16'h9e5b;
      expv[47] = 16'h6316;
      expv[48] = 16'h740e;
      expv[49] = 16'h35c1;
      expv[50] = 16'h9e5b;
      expv[51] = 16'h9e5b;
      expv[52] = 16'h86ed;
      expv[53] = 16'h9e5b;
      expv[54] = 16'h9e5b;
      expv[55] = 16'h9e5b;
      expv[56] = 16'h9e5b;
      expv[57] = 16'h9e5b;
      expv[58] = 16'h9e5b;
      expv[59] = 16'h9e5b;
      expv[60] = 16'h9e5b;
      expv[61] = 16'h9e5b;
      expv[62] = 16'h7074;
      expv[63] = 16'h4a4a;
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
