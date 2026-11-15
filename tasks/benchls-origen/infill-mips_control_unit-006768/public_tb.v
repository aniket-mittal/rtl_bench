// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006768 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .alu_op(out_vec[18:15]),
    .mem_to_reg(out_vec[14:14]),
    .mem_write(out_vec[13:13]),
    .reg_write(out_vec[12:12]),
    .reg_dst(out_vec[11:11]),
    .alu_src_b(out_vec[10:10]),
    .signed_ext(out_vec[9:9]),
    .beq(out_vec[8:8]),
    .bne(out_vec[7:7]),
    .jal(out_vec[6:6]),
    .jmp(out_vec[5:5]),
    .jr(out_vec[4:4]),
    .syscall(out_vec[3:3]),
    .my_B_signal(out_vec[2:2]),
    .my_A_signal(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hfda;
    stim[1] = 12'hdfb;
    stim[2] = 12'hde3;
    stim[3] = 12'hc9f;
    stim[4] = 12'hc79;
    stim[5] = 12'haf6;
    stim[6] = 12'hce2;
    stim[7] = 12'he32;
    stim[8] = 12'h946;
    stim[9] = 12'h705;
    stim[10] = 12'h48f;
    stim[11] = 12'h507;
    stim[12] = 12'hf12;
    stim[13] = 12'h160;
    stim[14] = 12'he8e;
    stim[15] = 12'h8e9;
    stim[16] = 12'h172;
    stim[17] = 12'h70b;
    stim[18] = 12'h0ea;
    stim[19] = 12'h8dc;
    stim[20] = 12'h82b;
    stim[21] = 12'hd53;
    stim[22] = 12'h255;
    stim[23] = 12'ha1a;
    stim[24] = 12'hddb;
    stim[25] = 12'h48c;
    stim[26] = 12'hf53;
    stim[27] = 12'h21c;
    stim[28] = 12'hd66;
    stim[29] = 12'h0ed;
    stim[30] = 12'h8b2;
    stim[31] = 12'h61c;
    stim[32] = 12'h862;
    stim[33] = 12'h83f;
    stim[34] = 12'h454;
    stim[35] = 12'h5cc;
    stim[36] = 12'hdcd;
    stim[37] = 12'he95;
    stim[38] = 12'h1ad;
    stim[39] = 12'h7f4;
    stim[40] = 12'hb33;
    stim[41] = 12'h927;
    stim[42] = 12'hc9e;
    stim[43] = 12'h71e;
    stim[44] = 12'hd46;
    stim[45] = 12'h491;
    stim[46] = 12'h457;
    stim[47] = 12'he5b;
    stim[48] = 12'h2e5;
    stim[49] = 12'h5dd;
    stim[50] = 12'h80f;
    stim[51] = 12'h415;
    stim[52] = 12'h176;
    stim[53] = 12'h8f4;
    stim[54] = 12'h6ab;
    stim[55] = 12'hcf2;
    stim[56] = 12'h5fb;
    stim[57] = 12'hd88;
    stim[58] = 12'h2ea;
    stim[59] = 12'h22d;
    stim[60] = 12'h466;
    stim[61] = 12'hb15;
    stim[62] = 12'h506;
    stim[63] = 12'hbcd;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h0a600;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h18280;
      expv[14] = 19'h00000;
      expv[15] = 19'h0d600;
      expv[16] = 19'h18280;
      expv[17] = 19'h00000;
      expv[18] = 19'h01040;
      expv[19] = 19'h0d600;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h09600;
      expv[28] = 19'h00000;
      expv[29] = 19'h01040;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h18280;
      expv[53] = 19'h0d600;
      expv[54] = 19'h00000;
      expv[55] = 19'h00000;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h09600;
      expv[60] = 19'h00000;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
