// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_024488 dut (
    .di(in_vec[31:0]),
    .zr_num(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hfbb07500;
    stim[1] = 32'h075e12ee;
    stim[2] = 32'haa45701c;
    stim[3] = 32'h4791a865;
    stim[4] = 32'h9cbba929;
    stim[5] = 32'h5c91f7db;
    stim[6] = 32'h262a11d7;
    stim[7] = 32'hfaf07f07;
    stim[8] = 32'hd73a3e5c;
    stim[9] = 32'h94fcdee1;
    stim[10] = 32'hc5e8f2ed;
    stim[11] = 32'h7e83964f;
    stim[12] = 32'h168b453a;
    stim[13] = 32'h238a89ba;
    stim[14] = 32'hc5357bae;
    stim[15] = 32'h70d395b6;
    stim[16] = 32'ha7d2b56b;
    stim[17] = 32'hd22232de;
    stim[18] = 32'ha3abcc66;
    stim[19] = 32'h2c36fc4f;
    stim[20] = 32'hc52d5bc9;
    stim[21] = 32'he1b38fee;
    stim[22] = 32'h0c21bf64;
    stim[23] = 32'h94aeffc2;
    stim[24] = 32'hdf346989;
    stim[25] = 32'h8359a419;
    stim[26] = 32'h5f146fe1;
    stim[27] = 32'h3fdb7938;
    stim[28] = 32'h6bf8f5fc;
    stim[29] = 32'hb1e7e789;
    stim[30] = 32'h5f0fad32;
    stim[31] = 32'h66fdc1bd;
    stim[32] = 32'h84ec3174;
    stim[33] = 32'h0e074e5d;
    stim[34] = 32'h86cb9f21;
    stim[35] = 32'h0f20b422;
    stim[36] = 32'hfd0b5727;
    stim[37] = 32'h40f94a32;
    stim[38] = 32'he8eaa871;
    stim[39] = 32'h0ec3dbb3;
    stim[40] = 32'h7ca29b13;
    stim[41] = 32'h03d62bd6;
    stim[42] = 32'h18b3a10c;
    stim[43] = 32'h61583c13;
    stim[44] = 32'hf10f7357;
    stim[45] = 32'h15035fbd;
    stim[46] = 32'h3521cc69;
    stim[47] = 32'h8c2a8fb5;
    stim[48] = 32'h8ff9a788;
    stim[49] = 32'h27ebfd2a;
    stim[50] = 32'hff6cf3e6;
    stim[51] = 32'h9966af84;
    stim[52] = 32'h764aaf78;
    stim[53] = 32'h5e686ef6;
    stim[54] = 32'h0d3f0666;
    stim[55] = 32'ha109e042;
    stim[56] = 32'h460b193a;
    stim[57] = 32'h7a163d80;
    stim[58] = 32'h02b03ef8;
    stim[59] = 32'h7d255ac9;
    stim[60] = 32'h716a5a54;
    stim[61] = 32'h2a62ec52;
    stim[62] = 32'hef5ec299;
    stim[63] = 32'ha09e8880;
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
      expv[0] = 6'h00;
      expv[1] = 6'h05;
      expv[2] = 6'h00;
      expv[3] = 6'h01;
      expv[4] = 6'h00;
      expv[5] = 6'h01;
      expv[6] = 6'h02;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h01;
      expv[12] = 6'h03;
      expv[13] = 6'h02;
      expv[14] = 6'h00;
      expv[15] = 6'h01;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h02;
      expv[20] = 6'h00;
      expv[21] = 6'h00;
      expv[22] = 6'h04;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h01;
      expv[27] = 6'h02;
      expv[28] = 6'h01;
      expv[29] = 6'h00;
      expv[30] = 6'h01;
      expv[31] = 6'h01;
      expv[32] = 6'h00;
      expv[33] = 6'h04;
      expv[34] = 6'h00;
      expv[35] = 6'h04;
      expv[36] = 6'h00;
      expv[37] = 6'h01;
      expv[38] = 6'h00;
      expv[39] = 6'h04;
      expv[40] = 6'h01;
      expv[41] = 6'h06;
      expv[42] = 6'h03;
      expv[43] = 6'h01;
      expv[44] = 6'h00;
      expv[45] = 6'h03;
      expv[46] = 6'h02;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h02;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h01;
      expv[53] = 6'h01;
      expv[54] = 6'h04;
      expv[55] = 6'h00;
      expv[56] = 6'h01;
      expv[57] = 6'h01;
      expv[58] = 6'h06;
      expv[59] = 6'h01;
      expv[60] = 6'h01;
      expv[61] = 6'h02;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
