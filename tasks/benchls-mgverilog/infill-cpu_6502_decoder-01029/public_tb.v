// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01029 dut (
    .opcode(in_vec[7:0]),
    .instr_len(out_vec[17:15]),
    .opa(out_vec[14:12]),
    .opb(out_vec[11:9]),
    .alu_op(out_vec[8:6]),
    .destination(out_vec[5:3]),
    .update_carry(out_vec[2:2]),
    .update_zero(out_vec[1:1]),
    .update_overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc8;
    stim[1] = 8'hfa;
    stim[2] = 8'h99;
    stim[3] = 8'hf0;
    stim[4] = 8'h35;
    stim[5] = 8'he6;
    stim[6] = 8'h0a;
    stim[7] = 8'h55;
    stim[8] = 8'he7;
    stim[9] = 8'h76;
    stim[10] = 8'ha1;
    stim[11] = 8'h95;
    stim[12] = 8'hfc;
    stim[13] = 8'h0f;
    stim[14] = 8'hce;
    stim[15] = 8'h4f;
    stim[16] = 8'h5f;
    stim[17] = 8'hf8;
    stim[18] = 8'hf0;
    stim[19] = 8'h8c;
    stim[20] = 8'h6a;
    stim[21] = 8'hf3;
    stim[22] = 8'h1a;
    stim[23] = 8'hb9;
    stim[24] = 8'hf0;
    stim[25] = 8'h26;
    stim[26] = 8'h94;
    stim[27] = 8'h6d;
    stim[28] = 8'hd9;
    stim[29] = 8'h3d;
    stim[30] = 8'h13;
    stim[31] = 8'hf9;
    stim[32] = 8'h27;
    stim[33] = 8'hda;
    stim[34] = 8'h86;
    stim[35] = 8'hb9;
    stim[36] = 8'hc8;
    stim[37] = 8'h92;
    stim[38] = 8'h3b;
    stim[39] = 8'h12;
    stim[40] = 8'h52;
    stim[41] = 8'h0a;
    stim[42] = 8'h1c;
    stim[43] = 8'h66;
    stim[44] = 8'h61;
    stim[45] = 8'h43;
    stim[46] = 8'ha1;
    stim[47] = 8'h22;
    stim[48] = 8'hda;
    stim[49] = 8'h41;
    stim[50] = 8'h2e;
    stim[51] = 8'h26;
    stim[52] = 8'hbc;
    stim[53] = 8'hfe;
    stim[54] = 8'hf6;
    stim[55] = 8'he3;
    stim[56] = 8'he3;
    stim[57] = 8'h24;
    stim[58] = 8'h67;
    stim[59] = 8'h93;
    stim[60] = 8'h4c;
    stim[61] = 8'h5f;
    stim[62] = 8'hcd;
    stim[63] = 8'ha8;
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
      expv[0] = 18'h0ae58;
      expv[1] = 18'h02e00;
      expv[2] = 18'h02e00;
      expv[3] = 18'h02e00;
      expv[4] = 18'h02e00;
      expv[5] = 18'h02e00;
      expv[6] = 18'h02e00;
      expv[7] = 18'h02e00;
      expv[8] = 18'h02e00;
      expv[9] = 18'h02e00;
      expv[10] = 18'h02e00;
      expv[11] = 18'h02e00;
      expv[12] = 18'h02e00;
      expv[13] = 18'h02e00;
      expv[14] = 18'h02e00;
      expv[15] = 18'h02e00;
      expv[16] = 18'h02e00;
      expv[17] = 18'h02e00;
      expv[18] = 18'h02e00;
      expv[19] = 18'h02e00;
      expv[20] = 18'h02e00;
      expv[21] = 18'h02e00;
      expv[22] = 18'h02e00;
      expv[23] = 18'h02e00;
      expv[24] = 18'h02e00;
      expv[25] = 18'h02e00;
      expv[26] = 18'h02e00;
      expv[27] = 18'h02e00;
      expv[28] = 18'h02e00;
      expv[29] = 18'h02e00;
      expv[30] = 18'h02e00;
      expv[31] = 18'h02e00;
      expv[32] = 18'h02e00;
      expv[33] = 18'h02e00;
      expv[34] = 18'h02e00;
      expv[35] = 18'h02e00;
      expv[36] = 18'h0ae58;
      expv[37] = 18'h02e00;
      expv[38] = 18'h02e00;
      expv[39] = 18'h02e00;
      expv[40] = 18'h02e00;
      expv[41] = 18'h02e00;
      expv[42] = 18'h02e00;
      expv[43] = 18'h02e00;
      expv[44] = 18'h02e00;
      expv[45] = 18'h02e00;
      expv[46] = 18'h02e00;
      expv[47] = 18'h02e00;
      expv[48] = 18'h02e00;
      expv[49] = 18'h02e00;
      expv[50] = 18'h02e00;
      expv[51] = 18'h02e00;
      expv[52] = 18'h02e00;
      expv[53] = 18'h02e00;
      expv[54] = 18'h02e00;
      expv[55] = 18'h02e00;
      expv[56] = 18'h02e00;
      expv[57] = 18'h02e00;
      expv[58] = 18'h02e00;
      expv[59] = 18'h02e00;
      expv[60] = 18'h02e00;
      expv[61] = 18'h02e00;
      expv[62] = 18'h02e00;
      expv[63] = 18'h02e00;
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
