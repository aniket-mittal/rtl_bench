// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143098 dut (
    .clk(clk),
    .clk_ena(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .in_stream(in_vec[7:0]),
    .pipeline_reg_0(out_vec[95:88]),
    .pipeline_reg_1(out_vec[87:80]),
    .pipeline_reg_2(out_vec[79:72]),
    .pipeline_reg_3(out_vec[71:64]),
    .pipeline_reg_4(out_vec[63:56]),
    .pipeline_reg_5(out_vec[55:48]),
    .pipeline_reg_6(out_vec[47:40]),
    .pipeline_reg_7(out_vec[39:32]),
    .pipeline_reg_8(out_vec[31:24]),
    .pipeline_reg_9(out_vec[23:16]),
    .pipeline_reg_10(out_vec[15:8]),
    .pipeline_reg_11(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h36d;
    stim[1] = 10'h1fa;
    stim[2] = 10'h2fb;
    stim[3] = 10'h2b4;
    stim[4] = 10'h2e6;
    stim[5] = 10'h01e;
    stim[6] = 10'h005;
    stim[7] = 10'h2cb;
    stim[8] = 10'h229;
    stim[9] = 10'h2f6;
    stim[10] = 10'h05f;
    stim[11] = 10'h0ff;
    stim[12] = 10'h233;
    stim[13] = 10'h2ad;
    stim[14] = 10'h2e8;
    stim[15] = 10'h017;
    stim[16] = 10'h237;
    stim[17] = 10'h00e;
    stim[18] = 10'h27b;
    stim[19] = 10'h0f4;
    stim[20] = 10'h2ef;
    stim[21] = 10'h052;
    stim[22] = 10'h054;
    stim[23] = 10'h0a8;
    stim[24] = 10'h25f;
    stim[25] = 10'h078;
    stim[26] = 10'h081;
    stim[27] = 10'h2d1;
    stim[28] = 10'h0e1;
    stim[29] = 10'h24a;
    stim[30] = 10'h287;
    stim[31] = 10'h209;
    stim[32] = 10'h05e;
    stim[33] = 10'h008;
    stim[34] = 10'h0d9;
    stim[35] = 10'h0e7;
    stim[36] = 10'h24b;
    stim[37] = 10'h037;
    stim[38] = 10'h268;
    stim[39] = 10'h070;
    stim[40] = 10'h0aa;
    stim[41] = 10'h0f7;
    stim[42] = 10'h002;
    stim[43] = 10'h015;
    stim[44] = 10'h207;
    stim[45] = 10'h018;
    stim[46] = 10'h200;
    stim[47] = 10'h29b;
    stim[48] = 10'h061;
    stim[49] = 10'h2e8;
    stim[50] = 10'h070;
    stim[51] = 10'h2e5;
    stim[52] = 10'h03d;
    stim[53] = 10'h00e;
    stim[54] = 10'h05b;
    stim[55] = 10'h025;
    stim[56] = 10'h277;
    stim[57] = 10'h0e5;
    stim[58] = 10'h099;
    stim[59] = 10'h2b2;
    stim[60] = 10'h214;
    stim[61] = 10'h0c6;
    stim[62] = 10'h00b;
    stim[63] = 10'h223;
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
      expv[0] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'hfb0000000000000000000000;
      expv[4] = 96'hb4fb00000000000000000000;
      expv[5] = 96'he6b4fb000000000000000000;
      expv[6] = 96'he6b4fb000000000000000000;
      expv[7] = 96'he6b4fb000000000000000000;
      expv[8] = 96'hcbe6b4fb0000000000000000;
      expv[9] = 96'h29cbe6b4fb00000000000000;
      expv[10] = 96'hf629cbe6b4fb000000000000;
      expv[11] = 96'hf629cbe6b4fb000000000000;
      expv[12] = 96'hf629cbe6b4fb000000000000;
      expv[13] = 96'h33f629cbe6b4fb0000000000;
      expv[14] = 96'had33f629cbe6b4fb00000000;
      expv[15] = 96'he8ad33f629cbe6b4fb000000;
      expv[16] = 96'he8ad33f629cbe6b4fb000000;
      expv[17] = 96'h37e8ad33f629cbe6b4fb0000;
      expv[18] = 96'h37e8ad33f629cbe6b4fb0000;
      expv[19] = 96'h7b37e8ad33f629cbe6b4fb00;
      expv[20] = 96'h7b37e8ad33f629cbe6b4fb00;
      expv[21] = 96'hef7b37e8ad33f629cbe6b4fb;
      expv[22] = 96'hef7b37e8ad33f629cbe6b4fb;
      expv[23] = 96'hef7b37e8ad33f629cbe6b4fb;
      expv[24] = 96'hef7b37e8ad33f629cbe6b4fb;
      expv[25] = 96'h5fef7b37e8ad33f629cbe6b4;
      expv[26] = 96'h5fef7b37e8ad33f629cbe6b4;
      expv[27] = 96'h5fef7b37e8ad33f629cbe6b4;
      expv[28] = 96'hd15fef7b37e8ad33f629cbe6;
      expv[29] = 96'hd15fef7b37e8ad33f629cbe6;
      expv[30] = 96'h4ad15fef7b37e8ad33f629cb;
      expv[31] = 96'h874ad15fef7b37e8ad33f629;
      expv[32] = 96'h09874ad15fef7b37e8ad33f6;
      expv[33] = 96'h09874ad15fef7b37e8ad33f6;
      expv[34] = 96'h09874ad15fef7b37e8ad33f6;
      expv[35] = 96'h09874ad15fef7b37e8ad33f6;
      expv[36] = 96'h09874ad15fef7b37e8ad33f6;
      expv[37] = 96'h4b09874ad15fef7b37e8ad33;
      expv[38] = 96'h4b09874ad15fef7b37e8ad33;
      expv[39] = 96'h684b09874ad15fef7b37e8ad;
      expv[40] = 96'h684b09874ad15fef7b37e8ad;
      expv[41] = 96'h684b09874ad15fef7b37e8ad;
      expv[42] = 96'h684b09874ad15fef7b37e8ad;
      expv[43] = 96'h684b09874ad15fef7b37e8ad;
      expv[44] = 96'h684b09874ad15fef7b37e8ad;
      expv[45] = 96'h07684b09874ad15fef7b37e8;
      expv[46] = 96'h07684b09874ad15fef7b37e8;
      expv[47] = 96'h0007684b09874ad15fef7b37;
      expv[48] = 96'h9b0007684b09874ad15fef7b;
      expv[49] = 96'h9b0007684b09874ad15fef7b;
      expv[50] = 96'he89b0007684b09874ad15fef;
      expv[51] = 96'he89b0007684b09874ad15fef;
      expv[52] = 96'he5e89b0007684b09874ad15f;
      expv[53] = 96'he5e89b0007684b09874ad15f;
      expv[54] = 96'he5e89b0007684b09874ad15f;
      expv[55] = 96'he5e89b0007684b09874ad15f;
      expv[56] = 96'he5e89b0007684b09874ad15f;
      expv[57] = 96'h77e5e89b0007684b09874ad1;
      expv[58] = 96'h77e5e89b0007684b09874ad1;
      expv[59] = 96'h77e5e89b0007684b09874ad1;
      expv[60] = 96'hb277e5e89b0007684b09874a;
      expv[61] = 96'h14b277e5e89b0007684b0987;
      expv[62] = 96'h14b277e5e89b0007684b0987;
      expv[63] = 96'h14b277e5e89b0007684b0987;
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
