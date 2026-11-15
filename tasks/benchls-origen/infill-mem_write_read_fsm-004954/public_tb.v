// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004954 dut (
    .clk(clk),
    .layer_reset(in_vec[65:65]),
    .read_address_i(in_vec[64:33]),
    .write_address_i(in_vec[32:1]),
    .stage_finish_i(in_vec[0:0]),
    .mem_rd_en_o(out_vec[33:33]),
    .mem_wr_en_o(out_vec[32:32]),
    .address_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3e4b4debd6d0f8dd4;
    stim[1] = 66'h3e29348423a4182da;
    stim[2] = 66'h1e9a7f48226085245;
    stim[3] = 66'h1a6eaf5cfe5bb4270;
    stim[4] = 66'h0736538c11a37015a;
    stim[5] = 66'h1badebab4c08e2379;
    stim[6] = 66'h1f58d1095c5f2a4fc;
    stim[7] = 66'h1e1a6d9c1dabbadbe;
    stim[8] = 66'h197eb6f60b209bef2;
    stim[9] = 66'h1cbe0f08650b2d032;
    stim[10] = 66'h0d87d77f902c3ec3b;
    stim[11] = 66'h0bd1a004b813faa8c;
    stim[12] = 66'h1e40fac7ca5722549;
    stim[13] = 66'h15083cb46c750b26d;
    stim[14] = 66'h101b6922d6d61f6d8;
    stim[15] = 66'h1eeabbd0fb8c26a40;
    stim[16] = 66'h13d8e66e55b9ecdbe;
    stim[17] = 66'h0e1ce04031d213c7d;
    stim[18] = 66'h0223875367e9e5deb;
    stim[19] = 66'h1a3a4457d97b4c634;
    stim[20] = 66'h06f4151edfadb138c;
    stim[21] = 66'h1be620103222ceaf7;
    stim[22] = 66'h07b2c5eed69d044a7;
    stim[23] = 66'h1c68fd7fdbd05aded;
    stim[24] = 66'h017ec30fe74157ef6;
    stim[25] = 66'h16bba16bf15f4b49d;
    stim[26] = 66'h103d1194f09b85d40;
    stim[27] = 66'h08a268b874a73b075;
    stim[28] = 66'h1edb148ea451150cd;
    stim[29] = 66'h04d20c564f028e45f;
    stim[30] = 66'h18050257dcb680663;
    stim[31] = 66'h072ae6a550d222c8c;
    stim[32] = 66'h10a95060731df0325;
    stim[33] = 66'h16228aa35b38c7874;
    stim[34] = 66'h178ea555c7442f98b;
    stim[35] = 66'h089b986c63edd984e;
    stim[36] = 66'h00671cafadd3dda7f;
    stim[37] = 66'h0fd025a8432ac5a6c;
    stim[38] = 66'h15f7dabb6dfee266e;
    stim[39] = 66'h0a3ada73a0a2c483a;
    stim[40] = 66'h0cb17388b18db90e6;
    stim[41] = 66'h125c36cb7560a3938;
    stim[42] = 66'h0c92f2145c7f22794;
    stim[43] = 66'h1c74464b97bc4bb53;
    stim[44] = 66'h17f3e385ee63bb7be;
    stim[45] = 66'h0f923e4800108e5fb;
    stim[46] = 66'h06b821ba822927003;
    stim[47] = 66'h0abcb941f0df9f612;
    stim[48] = 66'h02bb8e59df0b34a80;
    stim[49] = 66'h02cbc750c419bef08;
    stim[50] = 66'h1b54079176a6f7e2d;
    stim[51] = 66'h0f07fbc730970b5ad;
    stim[52] = 66'h05ecea20117b8e91a;
    stim[53] = 66'h1e24bfa5dde73130c;
    stim[54] = 66'h1a6b50c2157954307;
    stim[55] = 66'h0e015e78846b47745;
    stim[56] = 66'h0e0fe2bd0cd74a05b;
    stim[57] = 66'h01e5cd899508a3d0c;
    stim[58] = 66'h1c1fd9db69992f670;
    stim[59] = 66'h0dabbfafd94c8066c;
    stim[60] = 66'h0766634860ead4208;
    stim[61] = 66'h1df40c532653afa9e;
    stim[62] = 66'h04611fc327bcdfd5c;
    stim[63] = 66'h0b3997765ce458f69;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h11d20c16d;
      expv[5] = 34'h11d20c16d;
      expv[6] = 34'h2f149a421;
      expv[7] = 34'h2f149a421;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h11d20c16e;
      expv[13] = 34'h11d20c16e;
      expv[14] = 34'h2f149a422;
      expv[15] = 34'h2f149a422;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h11d20c16f;
      expv[20] = 34'h11d20c16f;
      expv[21] = 34'h2f149a423;
      expv[22] = 34'h2f149a423;
      expv[23] = 34'h000000000;
      expv[24] = 34'h11d20c170;
      expv[25] = 34'h11d20c170;
      expv[26] = 34'h2f149a424;
      expv[27] = 34'h2f149a424;
      expv[28] = 34'h000000000;
      expv[29] = 34'h11d20c171;
      expv[30] = 34'h11d20c171;
      expv[31] = 34'h2f149a425;
      expv[32] = 34'h2f149a425;
      expv[33] = 34'h000000000;
      expv[34] = 34'h11d20c172;
      expv[35] = 34'h11d20c172;
      expv[36] = 34'h2f149a426;
      expv[37] = 34'h2f149a426;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h000000000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h11d20c173;
      expv[46] = 34'h11d20c173;
      expv[47] = 34'h2f149a427;
      expv[48] = 34'h2f149a427;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h11d20c174;
      expv[53] = 34'h11d20c174;
      expv[54] = 34'h2f149a428;
      expv[55] = 34'h2f149a428;
      expv[56] = 34'h000000000;
      expv[57] = 34'h11d20c175;
      expv[58] = 34'h11d20c175;
      expv[59] = 34'h2f149a429;
      expv[60] = 34'h2f149a429;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
