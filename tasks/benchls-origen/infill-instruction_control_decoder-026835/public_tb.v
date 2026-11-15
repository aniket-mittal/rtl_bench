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

  origen_026835 dut (
    .ins(in_vec[31:0]),
    .store_imm(out_vec[9:9]),
    .ALU_src(out_vec[8:8]),
    .mem2reg(out_vec[7:7]),
    .reg_write(out_vec[6:6]),
    .mem_read(out_vec[5:5]),
    .mem_write(out_vec[4:4]),
    .ALU_op0(out_vec[3:2]),
    .ALU_op1(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h5873af10;
    stim[1] = 32'h2a9a090f;
    stim[2] = 32'h4ff45f54;
    stim[3] = 32'h012612f2;
    stim[4] = 32'h539b3a91;
    stim[5] = 32'hb54e2d0a;
    stim[6] = 32'h48ae550d;
    stim[7] = 32'h955525d4;
    stim[8] = 32'h0fad8aed;
    stim[9] = 32'h7afa47c0;
    stim[10] = 32'h99bf013f;
    stim[11] = 32'h901e713a;
    stim[12] = 32'hf42cab8e;
    stim[13] = 32'he6192dd0;
    stim[14] = 32'he9195077;
    stim[15] = 32'hfaded081;
    stim[16] = 32'h3f227ada;
    stim[17] = 32'h97cca743;
    stim[18] = 32'h30757585;
    stim[19] = 32'h580d5448;
    stim[20] = 32'he8669fa4;
    stim[21] = 32'h2ba44532;
    stim[22] = 32'h7feb7fa6;
    stim[23] = 32'h014e6437;
    stim[24] = 32'hf29efd2a;
    stim[25] = 32'he5c48570;
    stim[26] = 32'hc9286ebd;
    stim[27] = 32'h25decc74;
    stim[28] = 32'heab3a3c1;
    stim[29] = 32'hb56aebef;
    stim[30] = 32'h492f6e89;
    stim[31] = 32'hd7350d0e;
    stim[32] = 32'hf83d8364;
    stim[33] = 32'hab71ae61;
    stim[34] = 32'h36b1978a;
    stim[35] = 32'h47ef79d0;
    stim[36] = 32'h11d1224a;
    stim[37] = 32'h2f3b70c1;
    stim[38] = 32'ha1459468;
    stim[39] = 32'hd7ed60f6;
    stim[40] = 32'h3c45af95;
    stim[41] = 32'h0592474d;
    stim[42] = 32'hcd57e438;
    stim[43] = 32'h9072aeea;
    stim[44] = 32'h1adf5e62;
    stim[45] = 32'h5fa87d5d;
    stim[46] = 32'hae64d28b;
    stim[47] = 32'h522e488a;
    stim[48] = 32'h38431a27;
    stim[49] = 32'hefb95107;
    stim[50] = 32'hcf6f22bc;
    stim[51] = 32'he5c70187;
    stim[52] = 32'hd50a1b7f;
    stim[53] = 32'h5e162730;
    stim[54] = 32'h3192b8b3;
    stim[55] = 32'hd4b9663d;
    stim[56] = 32'h3c3d75bc;
    stim[57] = 32'hdcc7da1f;
    stim[58] = 32'hc1b2fe25;
    stim[59] = 32'hf16e937d;
    stim[60] = 32'h28972a36;
    stim[61] = 32'h61bd7184;
    stim[62] = 32'h698974f8;
    stim[63] = 32'hacb676fe;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'h1e0;
      expv[18] = 10'hxxx;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'h048;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
      expv[58] = 10'hxxx;
      expv[59] = 10'hxxx;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
