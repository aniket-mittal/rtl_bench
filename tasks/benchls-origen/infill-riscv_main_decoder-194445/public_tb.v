// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194445 dut (
    .idata(in_vec[31:0]),
    .alusrc(out_vec[17:16]),
    .memtoreg(out_vec[15:15]),
    .regwrite(out_vec[14:14]),
    .memwrite(out_vec[13:10]),
    .branch(out_vec[9:7]),
    .aluop(out_vec[6:5]),
    .regin(out_vec[4:3]),
    .imm(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h8b8d1095;
    stim[1] = 32'h5f23ec95;
    stim[2] = 32'h5baf0393;
    stim[3] = 32'h025131fc;
    stim[4] = 32'h90381def;
    stim[5] = 32'hba23ff7b;
    stim[6] = 32'h240d41b9;
    stim[7] = 32'h5ccf2ee1;
    stim[8] = 32'h6b6579d0;
    stim[9] = 32'he8b548c7;
    stim[10] = 32'hd344b026;
    stim[11] = 32'he708fc2c;
    stim[12] = 32'h35157bb5;
    stim[13] = 32'h42b74e25;
    stim[14] = 32'h59530b7b;
    stim[15] = 32'ha1a80aa9;
    stim[16] = 32'h7e9523da;
    stim[17] = 32'hec934a7f;
    stim[18] = 32'hecd21734;
    stim[19] = 32'h3cf040d1;
    stim[20] = 32'hd1f7bbff;
    stim[21] = 32'h4d19e971;
    stim[22] = 32'h3514b866;
    stim[23] = 32'h85665542;
    stim[24] = 32'h887b74fe;
    stim[25] = 32'h5512db30;
    stim[26] = 32'h45315e92;
    stim[27] = 32'h36426742;
    stim[28] = 32'h4b19bfbc;
    stim[29] = 32'he00710f8;
    stim[30] = 32'ha6fea3c1;
    stim[31] = 32'ha81d262f;
    stim[32] = 32'h81c2e26a;
    stim[33] = 32'h0f8c61b8;
    stim[34] = 32'h431c2506;
    stim[35] = 32'hfe53bf11;
    stim[36] = 32'hb5622a4f;
    stim[37] = 32'h40887e68;
    stim[38] = 32'hb37b2ffe;
    stim[39] = 32'h7966d407;
    stim[40] = 32'h388066ac;
    stim[41] = 32'h8714ebde;
    stim[42] = 32'hf31f01cb;
    stim[43] = 32'h338b78c1;
    stim[44] = 32'hb05c14d6;
    stim[45] = 32'hdea71d43;
    stim[46] = 32'hfc1b6ebf;
    stim[47] = 32'hd23b0f30;
    stim[48] = 32'h45cc5ced;
    stim[49] = 32'h87702217;
    stim[50] = 32'hb7635b69;
    stim[51] = 32'h694e7d04;
    stim[52] = 32'h65a63b4c;
    stim[53] = 32'h9e50a610;
    stim[54] = 32'he711e376;
    stim[55] = 32'h641876e6;
    stim[56] = 32'h215cf7f6;
    stim[57] = 32'h9de2fc70;
    stim[58] = 32'h30b67f56;
    stim[59] = 32'h66450d6f;
    stim[60] = 32'hd724797b;
    stim[61] = 32'h58103c55;
    stim[62] = 32'h6f06831a;
    stim[63] = 32'hd3eb8315;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h24014;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h001a3;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h14011;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h04040;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h04040;
      expv[48] = 18'h24014;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h14011;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h24014;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
