// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_fp17_add_core_chn_a_rsci_chn_a_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[20:20]),
    .chn_a_rsci_oswt(in_vec[19:19]),
    .chn_a_rsci_biwt(in_vec[18:18]),
    .chn_a_rsci_bdwt(in_vec[17:17]),
    .chn_a_rsci_d(in_vec[16:0]),
    .chn_a_rsci_bawt(out_vec[18:18]),
    .chn_a_rsci_wen_comp(out_vec[17:17]),
    .chn_a_rsci_d_mxwt(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0d3bae;
    stim[1] = 21'h050e67;
    stim[2] = 21'h117cb2;
    stim[3] = 21'h13b0ca;
    stim[4] = 21'h1cad59;
    stim[5] = 21'h164d7f;
    stim[6] = 21'h15ef61;
    stim[7] = 21'h12aeb6;
    stim[8] = 21'h1ba2e8;
    stim[9] = 21'h13dd36;
    stim[10] = 21'h1ece59;
    stim[11] = 21'h104fee;
    stim[12] = 21'h1e9ed5;
    stim[13] = 21'h1c5349;
    stim[14] = 21'h1dff04;
    stim[15] = 21'h1b5a2a;
    stim[16] = 21'h128ca3;
    stim[17] = 21'h10db80;
    stim[18] = 21'h0b9519;
    stim[19] = 21'h16abac;
    stim[20] = 21'h1af07f;
    stim[21] = 21'h16ae4d;
    stim[22] = 21'h1d2831;
    stim[23] = 21'h1d043f;
    stim[24] = 21'h175584;
    stim[25] = 21'h1cea2f;
    stim[26] = 21'h192343;
    stim[27] = 21'h189ca0;
    stim[28] = 21'h134f5b;
    stim[29] = 21'h19d1d4;
    stim[30] = 21'h147f8c;
    stim[31] = 21'h116498;
    stim[32] = 21'h19dddc;
    stim[33] = 21'h11f9f9;
    stim[34] = 21'h187312;
    stim[35] = 21'h18929a;
    stim[36] = 21'h131b56;
    stim[37] = 21'h11258f;
    stim[38] = 21'h1cc786;
    stim[39] = 21'h14360e;
    stim[40] = 21'h18cc0f;
    stim[41] = 21'h18782a;
    stim[42] = 21'h196574;
    stim[43] = 21'h1ca095;
    stim[44] = 21'h1f25a5;
    stim[45] = 21'h1d1afc;
    stim[46] = 21'h133ab6;
    stim[47] = 21'h161b8f;
    stim[48] = 21'h108612;
    stim[49] = 21'h19320d;
    stim[50] = 21'h1f6645;
    stim[51] = 21'h164d9e;
    stim[52] = 21'h1477f8;
    stim[53] = 21'h1fa232;
    stim[54] = 21'h1da20d;
    stim[55] = 21'h18e820;
    stim[56] = 21'h1c19b9;
    stim[57] = 21'h1fc4ce;
    stim[58] = 21'h15ac63;
    stim[59] = 21'h141d24;
    stim[60] = 21'h173973;
    stim[61] = 21'h1a567e;
    stim[62] = 21'h1b96c4;
    stim[63] = 21'h1fad53;
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
      expv[0] = 19'h73bae;
      expv[1] = 19'h70e67;
      expv[2] = 19'h37cb2;
      expv[3] = 19'h3b0ca;
      expv[4] = 19'h6ad59;
      expv[5] = 19'h6ad59;
      expv[6] = 19'h7ef61;
      expv[7] = 19'h7ef61;
      expv[8] = 19'h1a2e8;
      expv[9] = 19'h3dd36;
      expv[10] = 19'h6ce59;
      expv[11] = 19'h24fee;
      expv[12] = 19'h69ed5;
      expv[13] = 19'h65349;
      expv[14] = 19'h65349;
      expv[15] = 19'h65349;
      expv[16] = 19'h28ca3;
      expv[17] = 19'h2db80;
      expv[18] = 19'h19519;
      expv[19] = 19'h6abac;
      expv[20] = 19'h0f07f;
      expv[21] = 19'h6ae4d;
      expv[22] = 19'h72831;
      expv[23] = 19'h72831;
      expv[24] = 19'h72831;
      expv[25] = 19'h6ea2f;
      expv[26] = 19'h6ea2f;
      expv[27] = 19'h6ea2f;
      expv[28] = 19'h6ea2f;
      expv[29] = 19'h1d1d4;
      expv[30] = 19'h67f8c;
      expv[31] = 19'h67f8c;
      expv[32] = 19'h67f8c;
      expv[33] = 19'h67f8c;
      expv[34] = 19'h67f8c;
      expv[35] = 19'h67f8c;
      expv[36] = 19'h67f8c;
      expv[37] = 19'h3258f;
      expv[38] = 19'h6c786;
      expv[39] = 19'h6c786;
      expv[40] = 19'h6c786;
      expv[41] = 19'h6c786;
      expv[42] = 19'h6c786;
      expv[43] = 19'h6c786;
      expv[44] = 19'h6c786;
      expv[45] = 19'h71afc;
      expv[46] = 19'h71afc;
      expv[47] = 19'h61b8f;
      expv[48] = 19'h28612;
      expv[49] = 19'h1320d;
      expv[50] = 19'h76645;
      expv[51] = 19'h64d9e;
      expv[52] = 19'h677f8;
      expv[53] = 19'h677f8;
      expv[54] = 19'h7a20d;
      expv[55] = 19'h7a20d;
      expv[56] = 19'h7a20d;
      expv[57] = 19'h7a20d;
      expv[58] = 19'h7ac63;
      expv[59] = 19'h7ac63;
      expv[60] = 19'h7ac63;
      expv[61] = 19'h0567e;
      expv[62] = 19'h196c4;
      expv[63] = 19'h7ad53;
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
