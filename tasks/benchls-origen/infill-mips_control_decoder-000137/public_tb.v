// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000137 dut (
    .opcode(in_vec[11:6]),
    .funct(in_vec[5:0]),
    .jump(out_vec[10:10]),
    .beq(out_vec[9:9]),
    .bne(out_vec[8:8]),
    .wb(out_vec[7:6]),
    .m(out_vec[5:4]),
    .ex(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd55;
    stim[1] = 12'hacf;
    stim[2] = 12'h527;
    stim[3] = 12'h90e;
    stim[4] = 12'h0eb;
    stim[5] = 12'he85;
    stim[6] = 12'hb51;
    stim[7] = 12'h999;
    stim[8] = 12'h72a;
    stim[9] = 12'h69e;
    stim[10] = 12'h1f7;
    stim[11] = 12'h9c4;
    stim[12] = 12'h1da;
    stim[13] = 12'hb56;
    stim[14] = 12'h116;
    stim[15] = 12'h37a;
    stim[16] = 12'he57;
    stim[17] = 12'h159;
    stim[18] = 12'h078;
    stim[19] = 12'hda9;
    stim[20] = 12'hb43;
    stim[21] = 12'h02e;
    stim[22] = 12'ha3d;
    stim[23] = 12'h165;
    stim[24] = 12'hba3;
    stim[25] = 12'h20b;
    stim[26] = 12'hb90;
    stim[27] = 12'h50b;
    stim[28] = 12'hc6f;
    stim[29] = 12'h721;
    stim[30] = 12'hc27;
    stim[31] = 12'h54f;
    stim[32] = 12'heb9;
    stim[33] = 12'h9a0;
    stim[34] = 12'h490;
    stim[35] = 12'hc7b;
    stim[36] = 12'h371;
    stim[37] = 12'he6a;
    stim[38] = 12'h53c;
    stim[39] = 12'h66d;
    stim[40] = 12'hdb4;
    stim[41] = 12'hdee;
    stim[42] = 12'h2c8;
    stim[43] = 12'h9f5;
    stim[44] = 12'h98a;
    stim[45] = 12'hf07;
    stim[46] = 12'h04b;
    stim[47] = 12'hb5f;
    stim[48] = 12'h647;
    stim[49] = 12'hc6d;
    stim[50] = 12'hcf1;
    stim[51] = 12'ha4d;
    stim[52] = 12'he4d;
    stim[53] = 12'h0d9;
    stim[54] = 12'ha34;
    stim[55] = 12'hfa1;
    stim[56] = 12'h86f;
    stim[57] = 12'hd91;
    stim[58] = 12'h1bf;
    stim[59] = 12'hc61;
    stim[60] = 12'h3af;
    stim[61] = 12'h7a6;
    stim[62] = 12'h48e;
    stim[63] = 12'h52d;
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
      expv[0] = 11'h000;
      expv[1] = 11'h021;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h204;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h104;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h104;
      expv[24] = 11'h000;
      expv[25] = 11'h041;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
