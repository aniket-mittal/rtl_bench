// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_174342 dut (
    .inst(in_vec[31:0]),
    .ALU_OP(out_vec[39:37]),
    .rs(out_vec[36:32]),
    .rt(out_vec[31:27]),
    .rd(out_vec[26:22]),
    .Write_Reg(out_vec[21:21]),
    .imm(out_vec[20:5]),
    .rd_rt_s(out_vec[4:4]),
    .imm_s(out_vec[3:3]),
    .rt_imm_s(out_vec[2:2]),
    .Mem_Write(out_vec[1:1]),
    .alu_mem_s(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h9b0c9d2c;
    stim[1] = 32'hed9dc6da;
    stim[2] = 32'ha18d513f;
    stim[3] = 32'hfb6bc03c;
    stim[4] = 32'h2622f664;
    stim[5] = 32'h4a0888f7;
    stim[6] = 32'h65160dc3;
    stim[7] = 32'he83966a0;
    stim[8] = 32'h6e44ff0f;
    stim[9] = 32'h5999ebba;
    stim[10] = 32'h817044c2;
    stim[11] = 32'h7d63dec1;
    stim[12] = 32'ha8b76c24;
    stim[13] = 32'h4bcc9969;
    stim[14] = 32'he210626f;
    stim[15] = 32'hc079fa09;
    stim[16] = 32'h13579f34;
    stim[17] = 32'hca96d093;
    stim[18] = 32'h59b9b312;
    stim[19] = 32'h31e29337;
    stim[20] = 32'h5ab00d49;
    stim[21] = 32'h63bd1488;
    stim[22] = 32'hc5c81fe2;
    stim[23] = 32'hfb0905e2;
    stim[24] = 32'h77120375;
    stim[25] = 32'hf43f2285;
    stim[26] = 32'h754d4d76;
    stim[27] = 32'hcf45b551;
    stim[28] = 32'hd3aaaf0e;
    stim[29] = 32'h973b8cac;
    stim[30] = 32'h9310816d;
    stim[31] = 32'hbc8c3d33;
    stim[32] = 32'h6e7722c0;
    stim[33] = 32'h74a5abe9;
    stim[34] = 32'h2089de8f;
    stim[35] = 32'he879fa24;
    stim[36] = 32'h15ee36d5;
    stim[37] = 32'h3ad37498;
    stim[38] = 32'had660f2f;
    stim[39] = 32'h48e034fc;
    stim[40] = 32'h99844f0b;
    stim[41] = 32'h4fd7f904;
    stim[42] = 32'h72edddf5;
    stim[43] = 32'h76fcd9f7;
    stim[44] = 32'h4a5c78e2;
    stim[45] = 32'hee651dab;
    stim[46] = 32'h1ca2a8a8;
    stim[47] = 32'hd6ea2a5a;
    stim[48] = 32'h18bc2795;
    stim[49] = 32'hccf0dd82;
    stim[50] = 32'h9fc250f5;
    stim[51] = 32'h92afe1f1;
    stim[52] = 32'he1b723d5;
    stim[53] = 32'ha74bd8d4;
    stim[54] = 32'ha7b06ad1;
    stim[55] = 32'he55e2bd7;
    stim[56] = 32'hb40d1b10;
    stim[57] = 32'h6ff03eba;
    stim[58] = 32'hd728bddc;
    stim[59] = 32'h8da6871b;
    stim[60] = 32'h8b718fcd;
    stim[61] = 32'h24315216;
    stim[62] = 32'ha3622348;
    stim[63] = 32'h99289684;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h11103ecc9d;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h4f103266fd;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h04483bd1fd;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h16982e931d;
      expv[38] = 40'h0b3021e5fe;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0d3030e37c;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h01882a42dd;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
