// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_102594 dut (
    .instr(in_vec[32:1]),
    .zero(in_vec[0:0]),
    .ALUOp(out_vec[11:9]),
    .Reg2Loc(out_vec[8:8]),
    .MemtoReg(out_vec[7:7]),
    .RegWri(out_vec[6:6]),
    .MemWri(out_vec[5:5]),
    .BrTaken(out_vec[4:4]),
    .UncondBr(out_vec[3:3]),
    .Readmem(out_vec[2:2]),
    .ALUsrc(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0f0e69af6;
    stim[1] = 33'h0d44f8a81;
    stim[2] = 33'h01531780a;
    stim[3] = 33'h0ff7afcc4;
    stim[4] = 33'h12c28d182;
    stim[5] = 33'h10179cb5c;
    stim[6] = 33'h0e076ad3c;
    stim[7] = 33'h00ccd9fe5;
    stim[8] = 33'h082d89a72;
    stim[9] = 33'h03ed39052;
    stim[10] = 33'h1ccc1c892;
    stim[11] = 33'h03a9f884b;
    stim[12] = 33'h153e8b1b2;
    stim[13] = 33'h0c2608d5b;
    stim[14] = 33'h00cd97d46;
    stim[15] = 33'h1b91ddffb;
    stim[16] = 33'h0b9f95dc7;
    stim[17] = 33'h0285e1313;
    stim[18] = 33'h028ff614f;
    stim[19] = 33'h1437d5ce1;
    stim[20] = 33'h04e7faedd;
    stim[21] = 33'h19e0ff20e;
    stim[22] = 33'h12bfb2909;
    stim[23] = 33'h17f7e3c34;
    stim[24] = 33'h006fe2f45;
    stim[25] = 33'h031e2506c;
    stim[26] = 33'h0667c6610;
    stim[27] = 33'h0e63b24e3;
    stim[28] = 33'h1a0a9b0ef;
    stim[29] = 33'h0fdbac013;
    stim[30] = 33'h1e8365b90;
    stim[31] = 33'h03e9dc7e8;
    stim[32] = 33'h0cf1a4b76;
    stim[33] = 33'h041d86aa4;
    stim[34] = 33'h12d12636a;
    stim[35] = 33'h0abc51956;
    stim[36] = 33'h06e17f0b9;
    stim[37] = 33'h0da301fdc;
    stim[38] = 33'h081c3cbac;
    stim[39] = 33'h0d2da176a;
    stim[40] = 33'h11b6d6984;
    stim[41] = 33'h082735118;
    stim[42] = 33'h0d60cd301;
    stim[43] = 33'h0abc5b5f4;
    stim[44] = 33'h16e809be7;
    stim[45] = 33'h175f7c730;
    stim[46] = 33'h092f0a5c3;
    stim[47] = 33'h0477e9b4e;
    stim[48] = 33'h0c3d5b295;
    stim[49] = 33'h16f20d945;
    stim[50] = 33'h172a6683f;
    stim[51] = 33'h1915e8e51;
    stim[52] = 33'h125e152d3;
    stim[53] = 33'h109f6ef38;
    stim[54] = 33'h0c8418a18;
    stim[55] = 33'h080bd59a0;
    stim[56] = 33'h06c8d3b55;
    stim[57] = 33'h153951375;
    stim[58] = 33'h1deb44acf;
    stim[59] = 33'h00a8dd637;
    stim[60] = 33'h040f451c8;
    stim[61] = 33'h1f6833dae;
    stim[62] = 33'h1c04f4a38;
    stim[63] = 33'h1d8d79199;
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
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h018;
      expv[18] = 12'h018;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
