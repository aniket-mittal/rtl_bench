// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_fp32_add_core_chn_a_rsci_chn_a_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[35:35]),
    .chn_a_rsci_oswt(in_vec[34:34]),
    .chn_a_rsci_biwt(in_vec[33:33]),
    .chn_a_rsci_bdwt(in_vec[32:32]),
    .chn_a_rsci_d(in_vec[31:0]),
    .chn_a_rsci_bawt(out_vec[33:33]),
    .chn_a_rsci_wen_comp(out_vec[32:32]),
    .chn_a_rsci_d_mxwt(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h2ac59ffb4;
    stim[1] = 36'h57527f964;
    stim[2] = 36'h5c41544de;
    stim[3] = 36'hf67cb454f;
    stim[4] = 36'h20b1f6253;
    stim[5] = 36'hf1b476d95;
    stim[6] = 36'ha613d983f;
    stim[7] = 36'hd095b5e3a;
    stim[8] = 36'hc785bb089;
    stim[9] = 36'hb6e724f63;
    stim[10] = 36'h91bf7020e;
    stim[11] = 36'h8695d3d6c;
    stim[12] = 36'hb447dc6a5;
    stim[13] = 36'hbe4084122;
    stim[14] = 36'h9dad82939;
    stim[15] = 36'hae885ccd0;
    stim[16] = 36'he3130ea78;
    stim[17] = 36'hdad619dab;
    stim[18] = 36'he5c73b182;
    stim[19] = 36'hfe4be605e;
    stim[20] = 36'h8f4fdce76;
    stim[21] = 36'hab0ec77d6;
    stim[22] = 36'h9ee98006a;
    stim[23] = 36'haeca97c14;
    stim[24] = 36'hd09b7038c;
    stim[25] = 36'hc2356cd1d;
    stim[26] = 36'he9c0122cd;
    stim[27] = 36'hf703367db;
    stim[28] = 36'h8f03b06b5;
    stim[29] = 36'hd66af56e5;
    stim[30] = 36'hb6558a737;
    stim[31] = 36'h9b61adc97;
    stim[32] = 36'h9960628a7;
    stim[33] = 36'hc22ec78b6;
    stim[34] = 36'hc8b139210;
    stim[35] = 36'h43ae2bdc2;
    stim[36] = 36'he067f4e2d;
    stim[37] = 36'hf111b46e6;
    stim[38] = 36'h88b816af9;
    stim[39] = 36'hf0d3a68b6;
    stim[40] = 36'he5afd780a;
    stim[41] = 36'hf1b8ebf51;
    stim[42] = 36'hb0eab327a;
    stim[43] = 36'h8bd2a42b6;
    stim[44] = 36'h9b1a29653;
    stim[45] = 36'he44bccd21;
    stim[46] = 36'h8c0baa5a9;
    stim[47] = 36'hd342c29a6;
    stim[48] = 36'hb19eaf359;
    stim[49] = 36'h8058f2dd3;
    stim[50] = 36'h84582c949;
    stim[51] = 36'h90569f1bd;
    stim[52] = 36'hdf9f190fd;
    stim[53] = 36'ha917b8e4e;
    stim[54] = 36'h8e16ea4e2;
    stim[55] = 36'h17850af16;
    stim[56] = 36'ha5748244b;
    stim[57] = 36'hb6675c627;
    stim[58] = 36'hf5bcf7abf;
    stim[59] = 36'he4b406f94;
    stim[60] = 36'he92a12541;
    stim[61] = 36'hab5f28fee;
    stim[62] = 36'hc6092b7b6;
    stim[63] = 36'hbbf1cc557;
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
      expv[0] = 34'h3ac59ffb4;
      expv[1] = 34'h07527f964;
      expv[2] = 34'h0c41544de;
      expv[3] = 34'h367cb454f;
      expv[4] = 34'h30b1f6253;
      expv[5] = 34'h31b476d95;
      expv[6] = 34'h3613d983f;
      expv[7] = 34'h3613d983f;
      expv[8] = 34'h0785bb089;
      expv[9] = 34'h36e724f63;
      expv[10] = 34'h11bf7020e;
      expv[11] = 34'h1695d3d6c;
      expv[12] = 34'h3447dc6a5;
      expv[13] = 34'h3e4084122;
      expv[14] = 34'h1dad82939;
      expv[15] = 34'h3e885ccd0;
      expv[16] = 34'h3e885ccd0;
      expv[17] = 34'h3e885ccd0;
      expv[18] = 34'h35c73b182;
      expv[19] = 34'h35c73b182;
      expv[20] = 34'h1f4fdce76;
      expv[21] = 34'h3b0ec77d6;
      expv[22] = 34'h3b0ec77d6;
      expv[23] = 34'h3eca97c14;
      expv[24] = 34'h3eca97c14;
      expv[25] = 34'h02356cd1d;
      expv[26] = 34'h39c0122cd;
      expv[27] = 34'h39c0122cd;
      expv[28] = 34'h1f03b06b5;
      expv[29] = 34'h066af56e5;
      expv[30] = 34'h36558a737;
      expv[31] = 34'h1b61adc97;
      expv[32] = 34'h1960628a7;
      expv[33] = 34'h022ec78b6;
      expv[34] = 34'h08b139210;
      expv[35] = 34'h03ae2bdc2;
      expv[36] = 34'h3067f4e2d;
      expv[37] = 34'h3067f4e2d;
      expv[38] = 34'h18b816af9;
      expv[39] = 34'h30d3a68b6;
      expv[40] = 34'h35afd780a;
      expv[41] = 34'h35afd780a;
      expv[42] = 34'h30eab327a;
      expv[43] = 34'h1bd2a42b6;
      expv[44] = 34'h1b1a29653;
      expv[45] = 34'h344bccd21;
      expv[46] = 34'h344bccd21;
      expv[47] = 34'h344bccd21;
      expv[48] = 34'h319eaf359;
      expv[49] = 34'h1058f2dd3;
      expv[50] = 34'h14582c949;
      expv[51] = 34'h10569f1bd;
      expv[52] = 34'h0f9f190fd;
      expv[53] = 34'h3917b8e4e;
      expv[54] = 34'h3917b8e4e;
      expv[55] = 34'h17850af16;
      expv[56] = 34'h35748244b;
      expv[57] = 34'h35748244b;
      expv[58] = 34'h35bcf7abf;
      expv[59] = 34'h34b406f94;
      expv[60] = 34'h34b406f94;
      expv[61] = 34'h34b406f94;
      expv[62] = 34'h34b406f94;
      expv[63] = 34'h34b406f94;
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
