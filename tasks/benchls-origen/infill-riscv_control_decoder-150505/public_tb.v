// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_150505 dut (
    .IF_ID_Inst(in_vec[36:5]),
    .Instruction(in_vec[4:0]),
    .Branch(out_vec[11:11]),
    .MemRead(out_vec[10:10]),
    .MemtoReg(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .ALUSrc(out_vec[7:7]),
    .RegWrite(out_vec[6:6]),
    .JALR(out_vec[5:5]),
    .JAL(out_vec[4:4]),
    .AUIPC(out_vec[3:3]),
    .ECALL(out_vec[2:2]),
    .ALUOp(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h03105e24a6;
    stim[1] = 37'h10f2f6bfd6;
    stim[2] = 37'h13ca1e434d;
    stim[3] = 37'h148d5f0e27;
    stim[4] = 37'h0caad21b2f;
    stim[5] = 37'h186e9291a7;
    stim[6] = 37'h04b1807677;
    stim[7] = 37'h0cce4d0bde;
    stim[8] = 37'h179949ab14;
    stim[9] = 37'h05625ff936;
    stim[10] = 37'h1ec9adcea1;
    stim[11] = 37'h13d37f99a5;
    stim[12] = 37'h118e21ae4a;
    stim[13] = 37'h1c9a0e7f74;
    stim[14] = 37'h1934afdb18;
    stim[15] = 37'h0509633b89;
    stim[16] = 37'h18493406bb;
    stim[17] = 37'h00adb990cc;
    stim[18] = 37'h14d618d84f;
    stim[19] = 37'h1d1178d825;
    stim[20] = 37'h14658ef8cc;
    stim[21] = 37'h0b09e02605;
    stim[22] = 37'h1b37d636fb;
    stim[23] = 37'h0108100056;
    stim[24] = 37'h0c24906895;
    stim[25] = 37'h12bc1b39e9;
    stim[26] = 37'h17c0709f6d;
    stim[27] = 37'h1a39535faa;
    stim[28] = 37'h0139706d1a;
    stim[29] = 37'h0961ab9be8;
    stim[30] = 37'h1b4933b2e6;
    stim[31] = 37'h05c370f1f5;
    stim[32] = 37'h17ed1f221b;
    stim[33] = 37'h0a84bd8aca;
    stim[34] = 37'h0d728167bd;
    stim[35] = 37'h007e02d389;
    stim[36] = 37'h0a37ae7e4d;
    stim[37] = 37'h055c208b32;
    stim[38] = 37'h18823c9497;
    stim[39] = 37'h1b5f39e116;
    stim[40] = 37'h0d236646a3;
    stim[41] = 37'h14f0542813;
    stim[42] = 37'h147969204c;
    stim[43] = 37'h10a8fff111;
    stim[44] = 37'h0f6511bf51;
    stim[45] = 37'h06dbe81575;
    stim[46] = 37'h04a868428a;
    stim[47] = 37'h1fa51f8992;
    stim[48] = 37'h064275298d;
    stim[49] = 37'h133c371a9c;
    stim[50] = 37'h1a0d5938e9;
    stim[51] = 37'h1f7787a1cd;
    stim[52] = 37'h1558dda2cc;
    stim[53] = 37'h1b7da811bc;
    stim[54] = 37'h115cbb4ab1;
    stim[55] = 37'h067b7626d4;
    stim[56] = 37'h1b21aacdf3;
    stim[57] = 37'h070a41e067;
    stim[58] = 37'h132d4d6722;
    stim[59] = 37'h1a12c5af90;
    stim[60] = 37'h067dbc08be;
    stim[61] = 37'h0c6b699e48;
    stim[62] = 37'h0f16323ece;
    stim[63] = 37'h010409486c;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h0c8;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h801;
      expv[15] = 12'h000;
      expv[16] = 12'h2d0;
      expv[17] = 12'h042;
      expv[18] = 12'h000;
      expv[19] = 12'h0c8;
      expv[20] = 12'h042;
      expv[21] = 12'h0c8;
      expv[22] = 12'h2d0;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h180;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h2d0;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h042;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h004;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h042;
      expv[53] = 12'h004;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h180;
      expv[62] = 12'h000;
      expv[63] = 12'h042;
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
