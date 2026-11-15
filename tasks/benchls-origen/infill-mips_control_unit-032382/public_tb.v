// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_032382 dut (
    .Opcode(in_vec[7:2]),
    .rst(in_vec[1:1]),
    .Enable(in_vec[0:0]),
    .RegDst(out_vec[9:9]),
    .Branch(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemtoReg(out_vec[6:6]),
    .ALUOp(out_vec[5:4]),
    .MemWrite(out_vec[3:3]),
    .ALUSrc(out_vec[2:2]),
    .RegWrite(out_vec[1:1]),
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
    stim[0] = 8'h56;
    stim[1] = 8'he3;
    stim[2] = 8'hac;
    stim[3] = 8'h29;
    stim[4] = 8'h5c;
    stim[5] = 8'h45;
    stim[6] = 8'h64;
    stim[7] = 8'h2d;
    stim[8] = 8'h90;
    stim[9] = 8'h68;
    stim[10] = 8'hcd;
    stim[11] = 8'h90;
    stim[12] = 8'hd5;
    stim[13] = 8'hf9;
    stim[14] = 8'hf1;
    stim[15] = 8'hdc;
    stim[16] = 8'h3c;
    stim[17] = 8'h34;
    stim[18] = 8'h6c;
    stim[19] = 8'h81;
    stim[20] = 8'h45;
    stim[21] = 8'h68;
    stim[22] = 8'h01;
    stim[23] = 8'hd1;
    stim[24] = 8'hd5;
    stim[25] = 8'h50;
    stim[26] = 8'ha5;
    stim[27] = 8'h11;
    stim[28] = 8'h88;
    stim[29] = 8'h34;
    stim[30] = 8'h48;
    stim[31] = 8'h5d;
    stim[32] = 8'h3c;
    stim[33] = 8'h88;
    stim[34] = 8'h74;
    stim[35] = 8'hf5;
    stim[36] = 8'h5d;
    stim[37] = 8'hec;
    stim[38] = 8'he4;
    stim[39] = 8'h2c;
    stim[40] = 8'h10;
    stim[41] = 8'h10;
    stim[42] = 8'h4d;
    stim[43] = 8'h59;
    stim[44] = 8'h3c;
    stim[45] = 8'hfd;
    stim[46] = 8'h59;
    stim[47] = 8'hd1;
    stim[48] = 8'h00;
    stim[49] = 8'hd5;
    stim[50] = 8'he9;
    stim[51] = 8'hcd;
    stim[52] = 8'h64;
    stim[53] = 8'h29;
    stim[54] = 8'h2d;
    stim[55] = 8'h3d;
    stim[56] = 8'h88;
    stim[57] = 8'h1c;
    stim[58] = 8'hfd;
    stim[59] = 8'h31;
    stim[60] = 8'hc4;
    stim[61] = 8'he8;
    stim[62] = 8'h00;
    stim[63] = 8'he9;
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
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
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
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
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
