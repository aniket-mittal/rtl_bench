// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099335 dut (
    .clk(clk),
    .reset(in_vec[35:35]),
    .cs_update(in_vec[34:34]),
    .ip_update(in_vec[33:33]),
    .ip_in(in_vec[32:17]),
    .new_ip(in_vec[16:1]),
    .propagate(in_vec[0:0]),
    .ip_out(out_vec[16:1]),
    .update_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha0961ed79;
    stim[1] = 36'ha3adeaacf;
    stim[2] = 36'h6de7c2d0d;
    stim[3] = 36'h26439b993;
    stim[4] = 36'h3e976bf37;
    stim[5] = 36'h7766b7cdc;
    stim[6] = 36'h212357dc4;
    stim[7] = 36'h1e9a8b53b;
    stim[8] = 36'h55b619f98;
    stim[9] = 36'h6c6f1970f;
    stim[10] = 36'h68d52a3f6;
    stim[11] = 36'h331630cb6;
    stim[12] = 36'h8be672df5;
    stim[13] = 36'h4272bffd8;
    stim[14] = 36'h53a0c7cd5;
    stim[15] = 36'h4a54ab2e2;
    stim[16] = 36'h17357c710;
    stim[17] = 36'h5f3a19a3c;
    stim[18] = 36'h1ff9f325c;
    stim[19] = 36'h0557f5502;
    stim[20] = 36'h4a73b078f;
    stim[21] = 36'h4c2df865b;
    stim[22] = 36'h4ee0693f8;
    stim[23] = 36'h4bde23c28;
    stim[24] = 36'h2a2b44b1a;
    stim[25] = 36'h6543d1917;
    stim[26] = 36'h309032cc7;
    stim[27] = 36'hd101215c0;
    stim[28] = 36'h68233ef19;
    stim[29] = 36'h47f10e28c;
    stim[30] = 36'h7c12044c6;
    stim[31] = 36'h489b65d83;
    stim[32] = 36'h59c58b8b6;
    stim[33] = 36'h6a23da619;
    stim[34] = 36'h61c186cb7;
    stim[35] = 36'h64e9f0ec2;
    stim[36] = 36'h5411ffbbd;
    stim[37] = 36'h3704b7d6c;
    stim[38] = 36'h22a9a1112;
    stim[39] = 36'h1a468593e;
    stim[40] = 36'h25dba8ffe;
    stim[41] = 36'h38e263bd5;
    stim[42] = 36'h7196aa17a;
    stim[43] = 36'h35e3d71c4;
    stim[44] = 36'h26d6a5988;
    stim[45] = 36'hf05f2f005;
    stim[46] = 36'h337312feb;
    stim[47] = 36'h12cafff6f;
    stim[48] = 36'h0ecb36c37;
    stim[49] = 36'h0bf93a9c0;
    stim[50] = 36'h25c4ad5bd;
    stim[51] = 36'h35e7a3e1e;
    stim[52] = 36'h3772efb57;
    stim[53] = 36'h06f30fce9;
    stim[54] = 36'h58558b6d7;
    stim[55] = 36'h361b069dc;
    stim[56] = 36'h7f019cec7;
    stim[57] = 36'h69e7630a2;
    stim[58] = 36'h4a5fedfb6;
    stim[59] = 36'h400ff4d9c;
    stim[60] = 36'h411dd74a4;
    stim[61] = 36'h588a989dd;
    stim[62] = 36'hf22d76991;
    stim[63] = 36'h7915a97e6;
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
      expv[0] = 17'h1ed79;
      expv[1] = 17'h0aacf;
      expv[2] = 17'h02d0d;
      expv[3] = 17'h1b993;
      expv[4] = 17'h0bf37;
      expv[5] = 17'h17cdc;
      expv[6] = 17'h17cdc;
      expv[7] = 17'h17cdd;
      expv[8] = 17'h15b60;
      expv[9] = 17'h1970f;
      expv[10] = 17'h0a3f6;
      expv[11] = 17'h0a3f6;
      expv[12] = 17'h0be66;
      expv[13] = 17'h0272a;
      expv[14] = 17'h13a0d;
      expv[15] = 17'h0a54a;
      expv[16] = 17'h17356;
      expv[17] = 17'h1f3a0;
      expv[18] = 17'h1ff9e;
      expv[19] = 17'h0557e;
      expv[20] = 17'h0a73b;
      expv[21] = 17'h0c2df;
      expv[22] = 17'h0ee06;
      expv[23] = 17'h0bde2;
      expv[24] = 17'h04b1a;
      expv[25] = 17'h04b1b;
      expv[26] = 17'h12cc7;
      expv[27] = 17'h11012;
      expv[28] = 17'h1ef19;
      expv[29] = 17'h07f10;
      expv[30] = 17'h044c6;
      expv[31] = 17'h044c7;
      expv[32] = 17'h19c58;
      expv[33] = 17'h1a619;
      expv[34] = 17'h06cb7;
      expv[35] = 17'h10ec2;
      expv[36] = 17'h10ec3;
      expv[37] = 17'h17d6c;
      expv[38] = 17'h17d6c;
      expv[39] = 17'h17d6c;
      expv[40] = 17'h17d6c;
      expv[41] = 17'h17d6d;
      expv[42] = 17'h0a17a;
      expv[43] = 17'h0a17a;
      expv[44] = 17'h0a17a;
      expv[45] = 17'h0f005;
      expv[46] = 17'h12feb;
      expv[47] = 17'h12cae;
      expv[48] = 17'h0ecb2;
      expv[49] = 17'h0bf92;
      expv[50] = 17'h0d5bd;
      expv[51] = 17'h03e1e;
      expv[52] = 17'h03e1f;
      expv[53] = 17'h06f30;
      expv[54] = 17'h18559;
      expv[55] = 17'h069dc;
      expv[56] = 17'h069dd;
      expv[57] = 17'h030a2;
      expv[58] = 17'h030a2;
      expv[59] = 17'h030a2;
      expv[60] = 17'h030a2;
      expv[61] = 17'h030a3;
      expv[62] = 17'h16991;
      expv[63] = 17'h097e6;
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
