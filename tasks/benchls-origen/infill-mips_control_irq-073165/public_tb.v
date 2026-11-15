// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_073165 dut (
    .OpCode(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .PCSrc(out_vec[18:17]),
    .Branch(out_vec[16:16]),
    .RegWrite(out_vec[15:15]),
    .RegDst(out_vec[14:13]),
    .MemRead(out_vec[12:12]),
    .MemWrite(out_vec[11:11]),
    .MemtoReg(out_vec[10:9]),
    .ALUSrc1(out_vec[8:8]),
    .ALUSrc2(out_vec[7:7]),
    .ExtOp(out_vec[6:6]),
    .LuOp(out_vec[5:5]),
    .ALUOp(out_vec[4:1]),
    .irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h731;
    stim[1] = 12'hfba;
    stim[2] = 12'h5ce;
    stim[3] = 12'h78b;
    stim[4] = 12'h500;
    stim[5] = 12'h31b;
    stim[6] = 12'hcf0;
    stim[7] = 12'hadb;
    stim[8] = 12'h532;
    stim[9] = 12'h807;
    stim[10] = 12'hcdc;
    stim[11] = 12'h20a;
    stim[12] = 12'h612;
    stim[13] = 12'hcab;
    stim[14] = 12'ha90;
    stim[15] = 12'hb05;
    stim[16] = 12'hab6;
    stim[17] = 12'h2e2;
    stim[18] = 12'hbcc;
    stim[19] = 12'h5e3;
    stim[20] = 12'h13c;
    stim[21] = 12'ha4c;
    stim[22] = 12'hce0;
    stim[23] = 12'h97e;
    stim[24] = 12'he89;
    stim[25] = 12'h6c2;
    stim[26] = 12'hd31;
    stim[27] = 12'haf0;
    stim[28] = 12'h5ef;
    stim[29] = 12'h1ed;
    stim[30] = 12'hef7;
    stim[31] = 12'hc9e;
    stim[32] = 12'h448;
    stim[33] = 12'hc15;
    stim[34] = 12'h3bd;
    stim[35] = 12'h4ea;
    stim[36] = 12'h7c9;
    stim[37] = 12'h13d;
    stim[38] = 12'ha46;
    stim[39] = 12'he9d;
    stim[40] = 12'ha86;
    stim[41] = 12'h5fb;
    stim[42] = 12'h892;
    stim[43] = 12'hd40;
    stim[44] = 12'h803;
    stim[45] = 12'h662;
    stim[46] = 12'h93a;
    stim[47] = 12'h686;
    stim[48] = 12'hc16;
    stim[49] = 12'h393;
    stim[50] = 12'h125;
    stim[51] = 12'hb6a;
    stim[52] = 12'h066;
    stim[53] = 12'h28c;
    stim[54] = 12'h08f;
    stim[55] = 12'h3e0;
    stim[56] = 12'h411;
    stim[57] = 12'h375;
    stim[58] = 12'h929;
    stim[59] = 12'h2fd;
    stim[60] = 12'h1ba;
    stim[61] = 12'h627;
    stim[62] = 12'hc2b;
    stim[63] = 12'h192;
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
      expv[0] = 19'h00041;
      expv[1] = 19'h00041;
      expv[2] = 19'h00051;
      expv[3] = 19'h00041;
      expv[4] = 19'h00041;
      expv[5] = 19'h08084;
      expv[6] = 19'h00051;
      expv[7] = 19'h008d0;
      expv[8] = 19'h00041;
      expv[9] = 19'h00041;
      expv[10] = 19'h00051;
      expv[11] = 19'h080c0;
      expv[12] = 19'h00041;
      expv[13] = 19'h00041;
      expv[14] = 19'h00041;
      expv[15] = 19'h00041;
      expv[16] = 19'h00041;
      expv[17] = 19'h00051;
      expv[18] = 19'h00051;
      expv[19] = 19'h00051;
      expv[20] = 19'h10042;
      expv[21] = 19'h00051;
      expv[22] = 19'h00051;
      expv[23] = 19'h00051;
      expv[24] = 19'h00041;
      expv[25] = 19'h00051;
      expv[26] = 19'h00041;
      expv[27] = 19'h008d0;
      expv[28] = 19'h00051;
      expv[29] = 19'h00051;
      expv[30] = 19'h00051;
      expv[31] = 19'h00041;
      expv[32] = 19'h00051;
      expv[33] = 19'h00041;
      expv[34] = 19'h00041;
      expv[35] = 19'h00051;
      expv[36] = 19'h00051;
      expv[37] = 19'h10042;
      expv[38] = 19'h00051;
      expv[39] = 19'h00041;
      expv[40] = 19'h00041;
      expv[41] = 19'h00051;
      expv[42] = 19'h00041;
      expv[43] = 19'h00051;
      expv[44] = 19'h00041;
      expv[45] = 19'h00051;
      expv[46] = 19'h00041;
      expv[47] = 19'h00041;
      expv[48] = 19'h00041;
      expv[49] = 19'h00041;
      expv[50] = 19'h10042;
      expv[51] = 19'h00051;
      expv[52] = 19'h00051;
      expv[53] = 19'h00041;
      expv[54] = 19'h20040;
      expv[55] = 19'h080f0;
      expv[56] = 19'h00041;
      expv[57] = 19'h08096;
      expv[58] = 19'h00041;
      expv[59] = 19'h00051;
      expv[60] = 19'h00041;
      expv[61] = 19'h00041;
      expv[62] = 19'h00041;
      expv[63] = 19'h00041;
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
