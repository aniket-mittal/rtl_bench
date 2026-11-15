// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_005750 dut (
    .inst(in_vec[31:0]),
    .RegDst(out_vec[9:9]),
    .ALUsrc(out_vec[8:8]),
    .MemtoReg(out_vec[7:7]),
    .RegWrite(out_vec[6:6]),
    .MemRead(out_vec[5:5]),
    .MemWrite(out_vec[4:4]),
    .Branch(out_vec[3:3]),
    .ALUop(out_vec[2:1]),
    .Jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hdc4d169f;
    stim[1] = 32'hab7c8e50;
    stim[2] = 32'hc376ed57;
    stim[3] = 32'hb16c84f6;
    stim[4] = 32'hd93b4dce;
    stim[5] = 32'h333d3c79;
    stim[6] = 32'hf6d243fd;
    stim[7] = 32'h8c5300cd;
    stim[8] = 32'hcc75874e;
    stim[9] = 32'ha7d35076;
    stim[10] = 32'h8a621815;
    stim[11] = 32'h2d7146bf;
    stim[12] = 32'hd75655f2;
    stim[13] = 32'hfa80feaa;
    stim[14] = 32'hd8170d21;
    stim[15] = 32'ha49a2cc3;
    stim[16] = 32'hc96fb4d6;
    stim[17] = 32'h3df4d4e9;
    stim[18] = 32'he5e91b8b;
    stim[19] = 32'h4e64d02a;
    stim[20] = 32'h91413a24;
    stim[21] = 32'hcba3a67f;
    stim[22] = 32'h23d91e78;
    stim[23] = 32'h894fc529;
    stim[24] = 32'h21a8609b;
    stim[25] = 32'h09c0e391;
    stim[26] = 32'h605b2611;
    stim[27] = 32'h4d621cbc;
    stim[28] = 32'had57440f;
    stim[29] = 32'h1d7c793f;
    stim[30] = 32'h5d4fed20;
    stim[31] = 32'hd63d7547;
    stim[32] = 32'ha33a5982;
    stim[33] = 32'h3c771360;
    stim[34] = 32'h8f1ef388;
    stim[35] = 32'h7bcbfeaa;
    stim[36] = 32'h97449f2f;
    stim[37] = 32'h0e13bec5;
    stim[38] = 32'h2014fd72;
    stim[39] = 32'h31572588;
    stim[40] = 32'h58ace5b9;
    stim[41] = 32'h74dbbbed;
    stim[42] = 32'ha50e6b08;
    stim[43] = 32'h23c762d7;
    stim[44] = 32'hd129f971;
    stim[45] = 32'hf0e28f78;
    stim[46] = 32'hbac5b9db;
    stim[47] = 32'h7c0a1375;
    stim[48] = 32'hb670575e;
    stim[49] = 32'h366c6cca;
    stim[50] = 32'hce2be9e2;
    stim[51] = 32'hf9aa6245;
    stim[52] = 32'hc7dec95a;
    stim[53] = 32'h220ed735;
    stim[54] = 32'h73515a07;
    stim[55] = 32'h3bcec89b;
    stim[56] = 32'h86203710;
    stim[57] = 32'h4d6c9b25;
    stim[58] = 32'h4f98292a;
    stim[59] = 32'h81377b6c;
    stim[60] = 32'hd2a985a8;
    stim[61] = 32'h94778bcd;
    stim[62] = 32'hecd0d8ea;
    stim[63] = 32'hbc94b73b;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h1e0;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h040;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h040;
      expv[24] = 10'h000;
      expv[25] = 10'h041;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h110;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h1e0;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h040;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h040;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h040;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
