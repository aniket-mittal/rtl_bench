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

  origen_022761 dut (
    .INST(in_vec[31:0]),
    .ALUControl(out_vec[9:7]),
    .RegDst(out_vec[6:6]),
    .RegWrite(out_vec[5:5]),
    .ALUSrc(out_vec[4:4]),
    .MemWrite(out_vec[3:3]),
    .MemRead(out_vec[2:2]),
    .MemtoReg(out_vec[1:1]),
    .Branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb2efae9b;
    stim[1] = 32'h71b5373c;
    stim[2] = 32'h793883a4;
    stim[3] = 32'h2e9fdad4;
    stim[4] = 32'hd2dae8e3;
    stim[5] = 32'h8c6e37e1;
    stim[6] = 32'h0e286c24;
    stim[7] = 32'h33176c20;
    stim[8] = 32'hfb6586db;
    stim[9] = 32'hcb5c2188;
    stim[10] = 32'h5f787477;
    stim[11] = 32'h4796de3b;
    stim[12] = 32'h95a0cf68;
    stim[13] = 32'h55c4ad98;
    stim[14] = 32'hf09791bc;
    stim[15] = 32'hcd1dfbf0;
    stim[16] = 32'h4ea3f259;
    stim[17] = 32'h87912aef;
    stim[18] = 32'h3d7ef478;
    stim[19] = 32'h2a22cd83;
    stim[20] = 32'hd4c4e302;
    stim[21] = 32'h2726ffab;
    stim[22] = 32'h33ce0c8a;
    stim[23] = 32'h1cf406af;
    stim[24] = 32'h91b0738c;
    stim[25] = 32'h664ce732;
    stim[26] = 32'h509413af;
    stim[27] = 32'h9df4203b;
    stim[28] = 32'h7dbea5f4;
    stim[29] = 32'h1c84617b;
    stim[30] = 32'h45177d0f;
    stim[31] = 32'h3137582a;
    stim[32] = 32'h1a68a417;
    stim[33] = 32'h013abec0;
    stim[34] = 32'h180906c1;
    stim[35] = 32'h871dcaff;
    stim[36] = 32'h21879f31;
    stim[37] = 32'hb6f95e23;
    stim[38] = 32'h3ccde90d;
    stim[39] = 32'h68123d2c;
    stim[40] = 32'h91e28618;
    stim[41] = 32'hf1811ee1;
    stim[42] = 32'h6b4e66c5;
    stim[43] = 32'h3914c5a5;
    stim[44] = 32'h1879ed53;
    stim[45] = 32'h303bb379;
    stim[46] = 32'hcef8ec3c;
    stim[47] = 32'hb72370ea;
    stim[48] = 32'h46cb4a30;
    stim[49] = 32'h2f2e2660;
    stim[50] = 32'hc2de0f2f;
    stim[51] = 32'h192fa13f;
    stim[52] = 32'h4cf67267;
    stim[53] = 32'h6e108d88;
    stim[54] = 32'he1b40531;
    stim[55] = 32'h5eb654fd;
    stim[56] = 32'h8de5fcc6;
    stim[57] = 32'h0fa453d6;
    stim[58] = 32'hecfcb25a;
    stim[59] = 32'h95e804bf;
    stim[60] = 32'h7bffd931;
    stim[61] = 32'hfbf2d604;
    stim[62] = 32'h75c31fef;
    stim[63] = 32'h12aded79;
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
      expv[5] = 10'h2b6;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
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
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h260;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h2b0;
      expv[37] = 10'h000;
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
      expv[56] = 10'h2b6;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h301;
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
