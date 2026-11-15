// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145975 dut (
    .A(in_vec[39:24]),
    .B(in_vec[23:8]),
    .S(in_vec[7:4]),
    .BCD_input(in_vec[3:0]),
    .final_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h4007b33688;
    stim[1] = 40'h43b645b65f;
    stim[2] = 40'h83995df5dc;
    stim[3] = 40'hb1df018385;
    stim[4] = 40'ha89c5568ce;
    stim[5] = 40'h0b3528cc20;
    stim[6] = 40'h4cf106af05;
    stim[7] = 40'h3c74207932;
    stim[8] = 40'hb4963d8c75;
    stim[9] = 40'h1ffd75539a;
    stim[10] = 40'h55b9c3b59a;
    stim[11] = 40'h6ce765bc68;
    stim[12] = 40'h1d28fb7232;
    stim[13] = 40'h9c4adfad71;
    stim[14] = 40'h306ca7d8a2;
    stim[15] = 40'h9ecbd299ea;
    stim[16] = 40'ha8ebae2e52;
    stim[17] = 40'hbf3af1087a;
    stim[18] = 40'hb7cbafec5e;
    stim[19] = 40'hf726bf765b;
    stim[20] = 40'h54117be327;
    stim[21] = 40'h30d0043ea0;
    stim[22] = 40'h1c84e0485f;
    stim[23] = 40'ha66943b312;
    stim[24] = 40'h01f994078d;
    stim[25] = 40'h5e912e68cc;
    stim[26] = 40'hf63fa83e52;
    stim[27] = 40'h9295d2c8bc;
    stim[28] = 40'h1bedc0b071;
    stim[29] = 40'h879f25f15e;
    stim[30] = 40'h2d437ee6f8;
    stim[31] = 40'he3712c7538;
    stim[32] = 40'h1e2d09c823;
    stim[33] = 40'hd7aab1fe1b;
    stim[34] = 40'h09d1509625;
    stim[35] = 40'h4f8d8c5c19;
    stim[36] = 40'h4e85ce2ec1;
    stim[37] = 40'hb5f5a741b7;
    stim[38] = 40'h93348786b5;
    stim[39] = 40'ha374809756;
    stim[40] = 40'h380d98e0f4;
    stim[41] = 40'h9520e8e3ed;
    stim[42] = 40'h2473ac40b7;
    stim[43] = 40'he3710b1ffc;
    stim[44] = 40'h290d780b94;
    stim[45] = 40'h4ef41fbde3;
    stim[46] = 40'h079ac75a88;
    stim[47] = 40'h79e7c9e115;
    stim[48] = 40'h8d97568209;
    stim[49] = 40'hb4e99d67f4;
    stim[50] = 40'h78e26ad34b;
    stim[51] = 40'h6c4950546c;
    stim[52] = 40'ha5541ddcd6;
    stim[53] = 40'h13746e157b;
    stim[54] = 40'h2c05ddf44e;
    stim[55] = 40'hf3c2fe4e1f;
    stim[56] = 40'h5faf16470d;
    stim[57] = 40'h93806795cd;
    stim[58] = 40'h381408eebe;
    stim[59] = 40'h288ca03d5a;
    stim[60] = 40'h24ce4bcee5;
    stim[61] = 40'he547dae7e1;
    stim[62] = 40'hc7e61f1c29;
    stim[63] = 40'hb4ad9519e0;
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
      expv[0] = 8'h0f;
      expv[1] = 8'hb8;
      expv[2] = 8'h1f;
      expv[3] = 8'he4;
      expv[4] = 8'h8e;
      expv[5] = 8'h42;
      expv[6] = 8'h51;
      expv[7] = 8'h89;
      expv[8] = 8'h32;
      expv[9] = 8'hff;
      expv[10] = 8'hdd;
      expv[11] = 8'ha5;
      expv[12] = 8'h05;
      expv[13] = 8'h96;
      expv[14] = 8'h1d;
      expv[15] = 8'h7c;
      expv[16] = 8'h5f;
      expv[17] = 8'h76;
      expv[18] = 8'h62;
      expv[19] = 8'h39;
      expv[20] = 8'h5c;
      expv[21] = 8'h34;
      expv[22] = 8'h26;
      expv[23] = 8'hd5;
      expv[24] = 8'hfd;
      expv[25] = 8'hec;
      expv[26] = 8'h01;
      expv[27] = 8'h55;
      expv[28] = 8'hdb;
      expv[29] = 8'h01;
      expv[30] = 8'h62;
      expv[31] = 8'h44;
      expv[32] = 8'h4a;
      expv[33] = 8'h6d;
      expv[34] = 8'h47;
      expv[35] = 8'hb0;
      expv[36] = 8'he9;
      expv[37] = 8'hc5;
      expv[38] = 8'h6b;
      expv[39] = 8'hab;
      expv[40] = 8'h74;
      expv[41] = 8'h58;
      expv[42] = 8'h95;
      expv[43] = 8'hc9;
      expv[44] = 8'h8a;
      expv[45] = 8'h3e;
      expv[46] = 8'ha2;
      expv[47] = 8'hc1;
      expv[48] = 8'h96;
      expv[49] = 8'h6d;
      expv[50] = 8'h29;
      expv[51] = 8'h28;
      expv[52] = 8'h30;
      expv[53] = 8'hea;
      expv[54] = 8'h57;
      expv[55] = 8'h7f;
      expv[56] = 8'h63;
      expv[57] = 8'h3c;
      expv[58] = 8'h07;
      expv[59] = 8'h62;
      expv[60] = 8'h98;
      expv[61] = 8'h96;
      expv[62] = 8'hba;
      expv[63] = 8'hd2;
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
