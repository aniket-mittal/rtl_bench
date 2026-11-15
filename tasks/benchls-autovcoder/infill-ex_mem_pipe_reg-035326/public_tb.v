// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_035326 dut (
    .clk(clk),
    .rst(in_vec[21:21]),
    .id_ex_memread(in_vec[20:20]),
    .id_ex_memwrite(in_vec[19:19]),
    .id_ex_mem_to_reg(in_vec[18:18]),
    .id_ex_pc_src(in_vec[17:17]),
    .id_ex_rd(in_vec[16:12]),
    .id_ex_regwrite(in_vec[11:11]),
    .id_ex_ins_valid(in_vec[10:10]),
    .id_ex_rs1(in_vec[9:5]),
    .id_ex_rs2(in_vec[4:0]),
    .ex_mem_memread(out_vec[20:20]),
    .ex_mem_memwrite(out_vec[19:19]),
    .ex_mem_mem_to_reg(out_vec[18:18]),
    .ex_mem_pc_src(out_vec[17:17]),
    .ex_mem_rd(out_vec[16:12]),
    .ex_mem_regwrite(out_vec[11:11]),
    .ex_mem_ins_valid(out_vec[10:10]),
    .ex_mem_rs1(out_vec[9:5]),
    .ex_mem_rs2(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h23b98d;
    stim[1] = 22'h37fc01;
    stim[2] = 22'h0cfd42;
    stim[3] = 22'h10daad;
    stim[4] = 22'h0e0b07;
    stim[5] = 22'h05d08c;
    stim[6] = 22'h0b2296;
    stim[7] = 22'h16ad24;
    stim[8] = 22'h111960;
    stim[9] = 22'h150d03;
    stim[10] = 22'h08a799;
    stim[11] = 22'h056913;
    stim[12] = 22'h0cee3d;
    stim[13] = 22'h11184b;
    stim[14] = 22'h06f853;
    stim[15] = 22'h189654;
    stim[16] = 22'h257eb0;
    stim[17] = 22'h1d5d61;
    stim[18] = 22'h06efa4;
    stim[19] = 22'h01d7e3;
    stim[20] = 22'h023659;
    stim[21] = 22'h1c2db1;
    stim[22] = 22'h0d42e4;
    stim[23] = 22'h197f3a;
    stim[24] = 22'h0b512e;
    stim[25] = 22'h13ee29;
    stim[26] = 22'h15f5d7;
    stim[27] = 22'h182293;
    stim[28] = 22'h0a2f58;
    stim[29] = 22'h1bab68;
    stim[30] = 22'h02041b;
    stim[31] = 22'h0b832d;
    stim[32] = 22'h195e1d;
    stim[33] = 22'h066c3f;
    stim[34] = 22'h141879;
    stim[35] = 22'h1a4920;
    stim[36] = 22'h02c055;
    stim[37] = 22'h02ebcc;
    stim[38] = 22'h1c3552;
    stim[39] = 22'h035ea6;
    stim[40] = 22'h1aa042;
    stim[41] = 22'h1a4d94;
    stim[42] = 22'h11264a;
    stim[43] = 22'h185f4f;
    stim[44] = 22'h11d172;
    stim[45] = 22'h00e309;
    stim[46] = 22'h089359;
    stim[47] = 22'h12b9e6;
    stim[48] = 22'h0f093a;
    stim[49] = 22'h183f63;
    stim[50] = 22'h181ddf;
    stim[51] = 22'h1888bb;
    stim[52] = 22'h1e008a;
    stim[53] = 22'h0d24fa;
    stim[54] = 22'h0c0fc8;
    stim[55] = 22'h1798ef;
    stim[56] = 22'h091026;
    stim[57] = 22'h1721f6;
    stim[58] = 22'h09e0ab;
    stim[59] = 22'h07c9bc;
    stim[60] = 22'h1de536;
    stim[61] = 22'h171770;
    stim[62] = 22'h1e7ee6;
    stim[63] = 22'h14ddfd;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h0cfd42;
      expv[4] = 21'h10daad;
      expv[5] = 21'h0e0b07;
      expv[6] = 21'h05d08c;
      expv[7] = 21'h0b2296;
      expv[8] = 21'h16ad24;
      expv[9] = 21'h111960;
      expv[10] = 21'h150d03;
      expv[11] = 21'h08a799;
      expv[12] = 21'h056913;
      expv[13] = 21'h0cee3d;
      expv[14] = 21'h11184b;
      expv[15] = 21'h06f853;
      expv[16] = 21'h189654;
      expv[17] = 21'h000000;
      expv[18] = 21'h1d5d61;
      expv[19] = 21'h06efa4;
      expv[20] = 21'h01d7e3;
      expv[21] = 21'h023659;
      expv[22] = 21'h1c2db1;
      expv[23] = 21'h0d42e4;
      expv[24] = 21'h197f3a;
      expv[25] = 21'h0b512e;
      expv[26] = 21'h13ee29;
      expv[27] = 21'h15f5d7;
      expv[28] = 21'h182293;
      expv[29] = 21'h0a2f58;
      expv[30] = 21'h1bab68;
      expv[31] = 21'h02041b;
      expv[32] = 21'h0b832d;
      expv[33] = 21'h195e1d;
      expv[34] = 21'h066c3f;
      expv[35] = 21'h141879;
      expv[36] = 21'h1a4920;
      expv[37] = 21'h02c055;
      expv[38] = 21'h02ebcc;
      expv[39] = 21'h1c3552;
      expv[40] = 21'h035ea6;
      expv[41] = 21'h1aa042;
      expv[42] = 21'h1a4d94;
      expv[43] = 21'h11264a;
      expv[44] = 21'h185f4f;
      expv[45] = 21'h11d172;
      expv[46] = 21'h00e309;
      expv[47] = 21'h089359;
      expv[48] = 21'h12b9e6;
      expv[49] = 21'h0f093a;
      expv[50] = 21'h183f63;
      expv[51] = 21'h181ddf;
      expv[52] = 21'h1888bb;
      expv[53] = 21'h1e008a;
      expv[54] = 21'h0d24fa;
      expv[55] = 21'h0c0fc8;
      expv[56] = 21'h1798ef;
      expv[57] = 21'h091026;
      expv[58] = 21'h1721f6;
      expv[59] = 21'h09e0ab;
      expv[60] = 21'h07c9bc;
      expv[61] = 21'h1de536;
      expv[62] = 21'h171770;
      expv[63] = 21'h1e7ee6;
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
