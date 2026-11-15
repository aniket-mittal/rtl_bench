// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036966 dut (
    .WriteReg_ex_mem(in_vec[31:31]),
    .WriteReg_mem_wb(in_vec[30:30]),
    .MemRead_ex_mem(in_vec[29:29]),
    .Rs_id_ex(in_vec[28:24]),
    .Rt_id_ex(in_vec[23:19]),
    .Rd_ex_mem(in_vec[18:14]),
    .Rd_mem_wb(in_vec[13:9]),
    .Rs_ex_mem(in_vec[8:4]),
    .Rs_id_ex_valid(in_vec[3:3]),
    .Rt_id_ex_valid(in_vec[2:2]),
    .Rd_ex_mem_valid(in_vec[1:1]),
    .Rd_mem_wb_valid(in_vec[0:0]),
    .forwardA(out_vec[3:2]),
    .forwardB(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h8019aa4f;
    stim[1] = 32'ha01f83b9;
    stim[2] = 32'h8f3566b3;
    stim[3] = 32'h9740a829;
    stim[4] = 32'h1964b249;
    stim[5] = 32'ha47dd550;
    stim[6] = 32'h117bf77f;
    stim[7] = 32'h22741e44;
    stim[8] = 32'h2126a2d9;
    stim[9] = 32'hacd5b2d0;
    stim[10] = 32'h5632d134;
    stim[11] = 32'hbb5e91f9;
    stim[12] = 32'h0256bc35;
    stim[13] = 32'h233589cd;
    stim[14] = 32'h6f411a68;
    stim[15] = 32'h5a08dd19;
    stim[16] = 32'hd00a0ba2;
    stim[17] = 32'h2e2e0437;
    stim[18] = 32'h94c3a1c1;
    stim[19] = 32'h46a10f18;
    stim[20] = 32'hd4b3717b;
    stim[21] = 32'heb774f12;
    stim[22] = 32'hd98ef5c6;
    stim[23] = 32'h8441170b;
    stim[24] = 32'hbb9a9e8e;
    stim[25] = 32'h2495b992;
    stim[26] = 32'hd00a36ca;
    stim[27] = 32'h187f8bfa;
    stim[28] = 32'h6649ba71;
    stim[29] = 32'h4ec5e4d2;
    stim[30] = 32'h23cff40e;
    stim[31] = 32'hbaaf6c77;
    stim[32] = 32'hdbdc7207;
    stim[33] = 32'h0eb88ab8;
    stim[34] = 32'hffa4c7c7;
    stim[35] = 32'he945537d;
    stim[36] = 32'hd6ec352f;
    stim[37] = 32'h3dd18e0f;
    stim[38] = 32'heed10091;
    stim[39] = 32'h0ae56c51;
    stim[40] = 32'h65734503;
    stim[41] = 32'h1ade4206;
    stim[42] = 32'h59ecd796;
    stim[43] = 32'hb15a1f36;
    stim[44] = 32'h4e7ec8bf;
    stim[45] = 32'h2ef2137e;
    stim[46] = 32'haf84dac2;
    stim[47] = 32'h62bac131;
    stim[48] = 32'hc4f6bada;
    stim[49] = 32'h28c7bab3;
    stim[50] = 32'ha7515d4f;
    stim[51] = 32'hbf424b63;
    stim[52] = 32'h8f2efdf2;
    stim[53] = 32'hed6cdcc3;
    stim[54] = 32'h6f7f511d;
    stim[55] = 32'ha7fd6029;
    stim[56] = 32'h0dcff4ca;
    stim[57] = 32'h30ab4c8d;
    stim[58] = 32'h6eb93bc7;
    stim[59] = 32'hb6ddb49e;
    stim[60] = 32'h8a60054d;
    stim[61] = 32'h9bdd0b40;
    stim[62] = 32'hcc8fc0a4;
    stim[63] = 32'hddbbf971;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h8;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h4;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h8;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
