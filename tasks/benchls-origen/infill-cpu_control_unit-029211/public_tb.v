// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029211 dut (
    .select(in_vec[4:1]),
    .rst(in_vec[0:0]),
    .RegDst(out_vec[10:10]),
    .Branch(out_vec[9:9]),
    .MemRead(out_vec[8:8]),
    .MemtoReg(out_vec[7:7]),
    .MemWrite(out_vec[6:6]),
    .ALUSrc(out_vec[5:5]),
    .RegWrite(out_vec[4:4]),
    .ALUOp(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h11;
    stim[1] = 5'h1d;
    stim[2] = 5'h0e;
    stim[3] = 5'h14;
    stim[4] = 5'h08;
    stim[5] = 5'h18;
    stim[6] = 5'h0f;
    stim[7] = 5'h10;
    stim[8] = 5'h0e;
    stim[9] = 5'h1c;
    stim[10] = 5'h08;
    stim[11] = 5'h06;
    stim[12] = 5'h18;
    stim[13] = 5'h12;
    stim[14] = 5'h12;
    stim[15] = 5'h12;
    stim[16] = 5'h04;
    stim[17] = 5'h00;
    stim[18] = 5'h1a;
    stim[19] = 5'h0a;
    stim[20] = 5'h09;
    stim[21] = 5'h1e;
    stim[22] = 5'h08;
    stim[23] = 5'h1e;
    stim[24] = 5'h02;
    stim[25] = 5'h0c;
    stim[26] = 5'h06;
    stim[27] = 5'h04;
    stim[28] = 5'h10;
    stim[29] = 5'h08;
    stim[30] = 5'h0e;
    stim[31] = 5'h10;
    stim[32] = 5'h06;
    stim[33] = 5'h12;
    stim[34] = 5'h1e;
    stim[35] = 5'h04;
    stim[36] = 5'h1c;
    stim[37] = 5'h08;
    stim[38] = 5'h1c;
    stim[39] = 5'h1a;
    stim[40] = 5'h0c;
    stim[41] = 5'h0a;
    stim[42] = 5'h0a;
    stim[43] = 5'h0a;
    stim[44] = 5'h0a;
    stim[45] = 5'h08;
    stim[46] = 5'h14;
    stim[47] = 5'h1a;
    stim[48] = 5'h0e;
    stim[49] = 5'h0e;
    stim[50] = 5'h06;
    stim[51] = 5'h00;
    stim[52] = 5'h06;
    stim[53] = 5'h1f;
    stim[54] = 5'h04;
    stim[55] = 5'h1a;
    stim[56] = 5'h04;
    stim[57] = 5'h12;
    stim[58] = 5'h0e;
    stim[59] = 5'h10;
    stim[60] = 5'h14;
    stim[61] = 5'h02;
    stim[62] = 5'h04;
    stim[63] = 5'h1a;
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
      expv[1] = 11'h000;
      expv[2] = 11'h060;
      expv[3] = 11'h20a;
      expv[4] = 11'h034;
      expv[5] = 11'h01c;
      expv[6] = 11'h000;
      expv[7] = 11'h098;
      expv[8] = 11'h060;
      expv[9] = 11'h01e;
      expv[10] = 11'h034;
      expv[11] = 11'h033;
      expv[12] = 11'h01c;
      expv[13] = 11'h099;
      expv[14] = 11'h099;
      expv[15] = 11'h099;
      expv[16] = 11'h012;
      expv[17] = 11'h010;
      expv[18] = 11'h00d;
      expv[19] = 11'h035;
      expv[20] = 11'h000;
      expv[21] = 11'h01f;
      expv[22] = 11'h034;
      expv[23] = 11'h01f;
      expv[24] = 11'h011;
      expv[25] = 11'h1b0;
      expv[26] = 11'h033;
      expv[27] = 11'h012;
      expv[28] = 11'h098;
      expv[29] = 11'h034;
      expv[30] = 11'h060;
      expv[31] = 11'h098;
      expv[32] = 11'h033;
      expv[33] = 11'h099;
      expv[34] = 11'h01f;
      expv[35] = 11'h012;
      expv[36] = 11'h01e;
      expv[37] = 11'h034;
      expv[38] = 11'h01e;
      expv[39] = 11'h00d;
      expv[40] = 11'h1b0;
      expv[41] = 11'h035;
      expv[42] = 11'h035;
      expv[43] = 11'h035;
      expv[44] = 11'h035;
      expv[45] = 11'h034;
      expv[46] = 11'h20a;
      expv[47] = 11'h00d;
      expv[48] = 11'h060;
      expv[49] = 11'h060;
      expv[50] = 11'h033;
      expv[51] = 11'h010;
      expv[52] = 11'h033;
      expv[53] = 11'h000;
      expv[54] = 11'h012;
      expv[55] = 11'h00d;
      expv[56] = 11'h012;
      expv[57] = 11'h099;
      expv[58] = 11'h060;
      expv[59] = 11'h098;
      expv[60] = 11'h20a;
      expv[61] = 11'h011;
      expv[62] = 11'h012;
      expv[63] = 11'h00d;
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
