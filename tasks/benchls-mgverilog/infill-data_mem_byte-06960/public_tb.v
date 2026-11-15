// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06960 dut (
    .clk(clk),
    .addr(in_vec[47:36]),
    .din(in_vec[35:4]),
    .byteExt(in_vec[3:2]),
    .wEn(in_vec[1:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h67014f4f5289;
    stim[1] = 48'hceb5c50461f1;
    stim[2] = 48'he86570cd313e;
    stim[3] = 48'he21cb4e0e1a7;
    stim[4] = 48'h6c3daba68d14;
    stim[5] = 48'hbad2f8c033b6;
    stim[6] = 48'hd5acc022f605;
    stim[7] = 48'h67ae83175081;
    stim[8] = 48'h006005b061e9;
    stim[9] = 48'h6bc33c30cb56;
    stim[10] = 48'h53b1e1784a2d;
    stim[11] = 48'h81966ac774af;
    stim[12] = 48'h41964f84b096;
    stim[13] = 48'h0782db08ce29;
    stim[14] = 48'h48353140bd78;
    stim[15] = 48'hb0ddff51a667;
    stim[16] = 48'h6d525b39a7b9;
    stim[17] = 48'h250557cd065d;
    stim[18] = 48'had1741d4c719;
    stim[19] = 48'h42671d3e2f1a;
    stim[20] = 48'h773eac1c99a4;
    stim[21] = 48'h6cb23fb59494;
    stim[22] = 48'hfdce34aee660;
    stim[23] = 48'h8701fa4457ef;
    stim[24] = 48'haccc10b41da8;
    stim[25] = 48'hc9c5ddec7677;
    stim[26] = 48'h8cb853c7ef94;
    stim[27] = 48'h65a3b63d9a4a;
    stim[28] = 48'hd11ac9caa35a;
    stim[29] = 48'h7b7d21bc2a2e;
    stim[30] = 48'h5369c764ab0a;
    stim[31] = 48'h2c5372729ebf;
    stim[32] = 48'h29df221f0943;
    stim[33] = 48'h104300717196;
    stim[34] = 48'h7300bf7d4af7;
    stim[35] = 48'h1788f4b08fdc;
    stim[36] = 48'h9e7bb913fd10;
    stim[37] = 48'hc3157157adcd;
    stim[38] = 48'h4d45cc6bb3b6;
    stim[39] = 48'hcb2c50ae7b1f;
    stim[40] = 48'h2e555cc4cdf3;
    stim[41] = 48'h434214f4a0f0;
    stim[42] = 48'h03bf479964ee;
    stim[43] = 48'h4051038c6a89;
    stim[44] = 48'h99fad12eb73e;
    stim[45] = 48'hdf06712f2b51;
    stim[46] = 48'he97aa746e4ff;
    stim[47] = 48'h9c1deb861412;
    stim[48] = 48'h9eba66e322d1;
    stim[49] = 48'hf937c50e5b2f;
    stim[50] = 48'h240bfbcc19e5;
    stim[51] = 48'he7e3ee01ad08;
    stim[52] = 48'hb930c1190fde;
    stim[53] = 48'h80aa6d4e0509;
    stim[54] = 48'hcac288dfd414;
    stim[55] = 48'h75dc362586f3;
    stim[56] = 48'h19efb3a57f62;
    stim[57] = 48'h94673f8fbeb5;
    stim[58] = 48'hd0629228afdb;
    stim[59] = 48'hb8da13fa57b6;
    stim[60] = 48'h4658a5937284;
    stim[61] = 48'h5e256584dbe6;
    stim[62] = 48'h5eae92db61ee;
    stim[63] = 48'h3f6ce406adc6;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h000000xx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'h000000xx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'h000000xx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'h000000xx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'h000000xx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'h000000xx;
      expv[41] = 32'h000000xx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'h000000xx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h000000xx;
      expv[48] = 32'h000000xx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'h000000xx;
      expv[56] = 32'h000000xx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
