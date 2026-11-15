// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02428 dut (
    .cpx_io_grant_ca(in_vec[15:8]),
    .io_cpx_req_cq(in_vec[7:0]),
    .cpx_io_grant_bufio_ca(out_vec[15:8]),
    .io_cpx_req_bufio_cq_l(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hba9e;
    stim[1] = 16'hbb2e;
    stim[2] = 16'h5043;
    stim[3] = 16'h20a4;
    stim[4] = 16'h7e14;
    stim[5] = 16'h1ef0;
    stim[6] = 16'h12d6;
    stim[7] = 16'h84b4;
    stim[8] = 16'ha7f2;
    stim[9] = 16'h1572;
    stim[10] = 16'hf680;
    stim[11] = 16'hf761;
    stim[12] = 16'h19e2;
    stim[13] = 16'h21a9;
    stim[14] = 16'h30cf;
    stim[15] = 16'h8b60;
    stim[16] = 16'hdf27;
    stim[17] = 16'hbc21;
    stim[18] = 16'hef64;
    stim[19] = 16'h5609;
    stim[20] = 16'h6b80;
    stim[21] = 16'h1eb4;
    stim[22] = 16'hc732;
    stim[23] = 16'h34c2;
    stim[24] = 16'hdd53;
    stim[25] = 16'h8b0c;
    stim[26] = 16'h0d89;
    stim[27] = 16'h6e59;
    stim[28] = 16'h15af;
    stim[29] = 16'hf09d;
    stim[30] = 16'hf46d;
    stim[31] = 16'h256a;
    stim[32] = 16'h3f31;
    stim[33] = 16'h2709;
    stim[34] = 16'ha234;
    stim[35] = 16'h676d;
    stim[36] = 16'h73d4;
    stim[37] = 16'h71d5;
    stim[38] = 16'h00ac;
    stim[39] = 16'h3bcf;
    stim[40] = 16'hda52;
    stim[41] = 16'h3e3c;
    stim[42] = 16'hea88;
    stim[43] = 16'h913a;
    stim[44] = 16'hdb37;
    stim[45] = 16'h9de1;
    stim[46] = 16'h9bbc;
    stim[47] = 16'h701e;
    stim[48] = 16'h3b65;
    stim[49] = 16'hdde3;
    stim[50] = 16'h951a;
    stim[51] = 16'hf2fd;
    stim[52] = 16'hc051;
    stim[53] = 16'h0df0;
    stim[54] = 16'h902f;
    stim[55] = 16'h9c89;
    stim[56] = 16'hd99f;
    stim[57] = 16'h21c0;
    stim[58] = 16'h127a;
    stim[59] = 16'h753b;
    stim[60] = 16'h6ef0;
    stim[61] = 16'hff8f;
    stim[62] = 16'h2482;
    stim[63] = 16'h2df7;
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
      expv[0] = 16'hba61;
      expv[1] = 16'hbbd1;
      expv[2] = 16'h50bc;
      expv[3] = 16'h205b;
      expv[4] = 16'h7eeb;
      expv[5] = 16'h1e0f;
      expv[6] = 16'h1229;
      expv[7] = 16'h844b;
      expv[8] = 16'ha70d;
      expv[9] = 16'h158d;
      expv[10] = 16'hf67f;
      expv[11] = 16'hf79e;
      expv[12] = 16'h191d;
      expv[13] = 16'h2156;
      expv[14] = 16'h3030;
      expv[15] = 16'h8b9f;
      expv[16] = 16'hdfd8;
      expv[17] = 16'hbcde;
      expv[18] = 16'hef9b;
      expv[19] = 16'h56f6;
      expv[20] = 16'h6b7f;
      expv[21] = 16'h1e4b;
      expv[22] = 16'hc7cd;
      expv[23] = 16'h343d;
      expv[24] = 16'hddac;
      expv[25] = 16'h8bf3;
      expv[26] = 16'h0d76;
      expv[27] = 16'h6ea6;
      expv[28] = 16'h1550;
      expv[29] = 16'hf062;
      expv[30] = 16'hf492;
      expv[31] = 16'h2595;
      expv[32] = 16'h3fce;
      expv[33] = 16'h27f6;
      expv[34] = 16'ha2cb;
      expv[35] = 16'h6792;
      expv[36] = 16'h732b;
      expv[37] = 16'h712a;
      expv[38] = 16'h0053;
      expv[39] = 16'h3b30;
      expv[40] = 16'hdaad;
      expv[41] = 16'h3ec3;
      expv[42] = 16'hea77;
      expv[43] = 16'h91c5;
      expv[44] = 16'hdbc8;
      expv[45] = 16'h9d1e;
      expv[46] = 16'h9b43;
      expv[47] = 16'h70e1;
      expv[48] = 16'h3b9a;
      expv[49] = 16'hdd1c;
      expv[50] = 16'h95e5;
      expv[51] = 16'hf202;
      expv[52] = 16'hc0ae;
      expv[53] = 16'h0d0f;
      expv[54] = 16'h90d0;
      expv[55] = 16'h9c76;
      expv[56] = 16'hd960;
      expv[57] = 16'h213f;
      expv[58] = 16'h1285;
      expv[59] = 16'h75c4;
      expv[60] = 16'h6e0f;
      expv[61] = 16'hff70;
      expv[62] = 16'h247d;
      expv[63] = 16'h2d08;
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
