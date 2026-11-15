// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_088563 dut (
    .clk(clk),
    .rst_n(in_vec[27:27]),
    .flag_op_caddr(in_vec[26:25]),
    .code(in_vec[24:9]),
    .data(in_vec[8:1]),
    .dbg_clk(in_vec[0:0]),
    .code_addr(out_vec[18:3]),
    .dbg_local_f_pn(out_vec[2:2]),
    .dbg_local_f_mem(out_vec[1:1]),
    .dbg_local_f_lh(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h674661f;
    stim[1] = 28'h4017972;
    stim[2] = 28'hb130f5e;
    stim[3] = 28'hdfa4480;
    stim[4] = 28'hcba9294;
    stim[5] = 28'hfb4ad0f;
    stim[6] = 28'hc50191c;
    stim[7] = 28'hf18456d;
    stim[8] = 28'he1bba9e;
    stim[9] = 28'hc69443d;
    stim[10] = 28'hc2c3d2c;
    stim[11] = 28'hebb883f;
    stim[12] = 28'hf0de455;
    stim[13] = 28'hf88dea1;
    stim[14] = 28'h90b0420;
    stim[15] = 28'hdc3753b;
    stim[16] = 28'h9044b7e;
    stim[17] = 28'hb48f930;
    stim[18] = 28'habcf0d8;
    stim[19] = 28'h9b8fbe8;
    stim[20] = 28'hc9f7718;
    stim[21] = 28'hf12a627;
    stim[22] = 28'hfbce993;
    stim[23] = 28'hedbb6f0;
    stim[24] = 28'hc7006fb;
    stim[25] = 28'hae6a1b2;
    stim[26] = 28'hb629cfd;
    stim[27] = 28'hce2d407;
    stim[28] = 28'hbc3c9a7;
    stim[29] = 28'hf892339;
    stim[30] = 28'he4b58e3;
    stim[31] = 28'hc6276e8;
    stim[32] = 28'hc66e43d;
    stim[33] = 28'he80faad;
    stim[34] = 28'haf2c246;
    stim[35] = 28'h8608622;
    stim[36] = 28'headd6a1;
    stim[37] = 28'ha1d9a96;
    stim[38] = 28'hb44ab44;
    stim[39] = 28'hbfbc5fe;
    stim[40] = 28'hac4d9f7;
    stim[41] = 28'h80e5b19;
    stim[42] = 28'hf0a2212;
    stim[43] = 28'hf89eca3;
    stim[44] = 28'he78d789;
    stim[45] = 28'h9362478;
    stim[46] = 28'he906537;
    stim[47] = 28'h6b6fe88;
    stim[48] = 28'h80cb0f0;
    stim[49] = 28'he57b6e7;
    stim[50] = 28'h92406a5;
    stim[51] = 28'hb2e1dc8;
    stim[52] = 28'hbf497a3;
    stim[53] = 28'hd8cf5cf;
    stim[54] = 28'hb43566d;
    stim[55] = 28'ha686694;
    stim[56] = 28'hb8f1b25;
    stim[57] = 28'hc9f4980;
    stim[58] = 28'hae9afa6;
    stim[59] = 28'h9f355ba;
    stim[60] = 28'h9f874d2;
    stim[61] = 28'h647cb4f;
    stim[62] = 28'hc538422;
    stim[63] = 28'hf07da7f;
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
      expv[0] = 19'h00003;
      expv[1] = 19'h00000;
      expv[2] = 19'h00004;
      expv[3] = 19'h0000f;
      expv[4] = 19'h7c179;
      expv[5] = 19'h7f01d;
      expv[6] = 19'h06d2a;
      expv[7] = 19'h0812c;
      expv[8] = 19'h04610;
      expv[9] = 19'h006eb;
      expv[10] = 19'h02139;
      expv[11] = 19'h02c41;
      expv[12] = 19'h02ee4;
      expv[13] = 19'h0437c;
      expv[14] = 19'h06234;
      expv[15] = 19'h06236;
      expv[16] = 19'h0315c;
      expv[17] = 19'h0315e;
      expv[18] = 19'h03161;
      expv[19] = 19'h0316d;
      expv[20] = 19'h03168;
      expv[21] = 19'h05944;
      expv[22] = 19'h044ad;
      expv[23] = 19'h06f3a;
      expv[24] = 19'h036eb;
      expv[25] = 19'h052eb;
      expv[26] = 19'h052f7;
      expv[27] = 19'h052fb;
      expv[28] = 19'h08bae;
      expv[29] = 19'h08bb4;
      expv[30] = 19'h0624a;
      expv[31] = 19'h012d3;
      expv[32] = 19'h02b6b;
      expv[33] = 19'h04520;
      expv[34] = 19'h0203b;
      expv[35] = 19'h02043;
      expv[36] = 19'h02041;
      expv[37] = 19'h02b70;
      expv[38] = 19'h02b7e;
      expv[39] = 19'h02b87;
      expv[40] = 19'h02b8a;
      expv[41] = 19'h02b90;
      expv[42] = 19'h02b94;
      expv[43] = 19'h0428c;
      expv[44] = 19'h0627b;
      expv[45] = 19'h01e35;
      expv[46] = 19'h01e30;
      expv[47] = 19'h00001;
      expv[48] = 19'h00000;
      expv[49] = 19'h00002;
      expv[50] = 19'h015ed;
      expv[51] = 19'h015ed;
      expv[52] = 19'h015f7;
      expv[53] = 19'h015fc;
      expv[54] = 19'h7f2c6;
      expv[55] = 19'h7f2cb;
      expv[56] = 19'h7f2d4;
      expv[57] = 19'h7f2d8;
      expv[58] = 19'h01aab;
      expv[59] = 19'h01ab7;
      expv[60] = 19'h01ab7;
      expv[61] = 19'h00002;
      expv[62] = 19'h00002;
      expv[63] = 19'h014e4;
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
