// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  NV_NVDLA_CMAC_CORE_MAC_booth dut (
    .code(in_vec[20:18]),
    .is_8bit(in_vec[17:17]),
    .sign(in_vec[16:16]),
    .src_data(in_vec[15:0]),
    .out_data(out_vec[17:1]),
    .out_inv(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1d33cd;
    stim[1] = 21'h192b1c;
    stim[2] = 21'h1b0abd;
    stim[3] = 21'h09d930;
    stim[4] = 21'h145365;
    stim[5] = 21'h1be31d;
    stim[6] = 21'h01df7b;
    stim[7] = 21'h1280b6;
    stim[8] = 21'h04c408;
    stim[9] = 21'h105508;
    stim[10] = 21'h1e7d37;
    stim[11] = 21'h0ad00a;
    stim[12] = 21'h128a1f;
    stim[13] = 21'h07e77f;
    stim[14] = 21'h071655;
    stim[15] = 21'h180806;
    stim[16] = 21'h054169;
    stim[17] = 21'h1eaa78;
    stim[18] = 21'h0556a8;
    stim[19] = 21'h067b56;
    stim[20] = 21'h05639e;
    stim[21] = 21'h0bccdd;
    stim[22] = 21'h1d3762;
    stim[23] = 21'h050c37;
    stim[24] = 21'h00e2ec;
    stim[25] = 21'h1d72da;
    stim[26] = 21'h1bcc42;
    stim[27] = 21'h1b7b77;
    stim[28] = 21'h0cdf4f;
    stim[29] = 21'h06612c;
    stim[30] = 21'h1d553e;
    stim[31] = 21'h062ec2;
    stim[32] = 21'h14375f;
    stim[33] = 21'h1bff29;
    stim[34] = 21'h088e2b;
    stim[35] = 21'h0cc1ee;
    stim[36] = 21'h1d51d3;
    stim[37] = 21'h1fd862;
    stim[38] = 21'h1e5377;
    stim[39] = 21'h1224e0;
    stim[40] = 21'h161271;
    stim[41] = 21'h1c3543;
    stim[42] = 21'h1e25e4;
    stim[43] = 21'h02dc64;
    stim[44] = 21'h12c6f3;
    stim[45] = 21'h043d74;
    stim[46] = 21'h0d946b;
    stim[47] = 21'h0d55d7;
    stim[48] = 21'h0c7e79;
    stim[49] = 21'h1ae80d;
    stim[50] = 21'h039acb;
    stim[51] = 21'h154b96;
    stim[52] = 21'h15a5c1;
    stim[53] = 21'h114837;
    stim[54] = 21'h01b587;
    stim[55] = 21'h09f9d8;
    stim[56] = 21'h1ac7bf;
    stim[57] = 21'h0780a6;
    stim[58] = 21'h066ef0;
    stim[59] = 21'h086b5b;
    stim[60] = 21'h02735c;
    stim[61] = 21'h0f80b4;
    stim[62] = 21'h0c7414;
    stim[63] = 21'h1a95d7;
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
      expv[0] = 18'h20000;
      expv[1] = 18'h25638;
      expv[2] = 18'h0017a;
      expv[3] = 18'h24d9f;
      expv[4] = 18'h15935;
      expv[5] = 18'h0023a;
      expv[6] = 18'h20000;
      expv[7] = 18'h00327;
      expv[8] = 18'h18810;
      expv[9] = 18'h0abdf;
      expv[10] = 18'h00200;
      expv[11] = 18'h00214;
      expv[12] = 18'h00183;
      expv[13] = 18'h00101;
      expv[14] = 18'h00155;
      expv[15] = 18'h1eff3;
      expv[16] = 18'h17d2d;
      expv[17] = 18'h00200;
      expv[18] = 18'h152af;
      expv[19] = 18'h002ac;
      expv[20] = 18'h138c3;
      expv[21] = 18'h00245;
      expv[22] = 18'h20000;
      expv[23] = 18'h1e791;
      expv[24] = 18'h20000;
      expv[25] = 18'h20000;
      expv[26] = 18'h00284;
      expv[27] = 18'h002ee;
      expv[28] = 18'h17d3c;
      expv[29] = 18'h00258;
      expv[30] = 18'h20000;
      expv[31] = 18'h00184;
      expv[32] = 18'h19141;
      expv[33] = 18'h00252;
      expv[34] = 18'h11c56;
      expv[35] = 18'h107b8;
      expv[36] = 18'h20000;
      expv[37] = 18'h00200;
      expv[38] = 18'h00200;
      expv[39] = 18'h0027f;
      expv[40] = 18'h0011d;
      expv[41] = 18'h20000;
      expv[42] = 18'h00200;
      expv[43] = 18'h00200;
      expv[44] = 18'h00233;
      expv[45] = 18'h27ae8;
      expv[46] = 18'h3ae53;
      expv[47] = 18'h0a8a3;
      expv[48] = 18'h3f9e4;
      expv[49] = 18'h001e5;
      expv[50] = 18'h00200;
      expv[51] = 18'h2972c;
      expv[52] = 18'h14b82;
      expv[53] = 18'h320dc;
      expv[54] = 18'h20000;
      expv[55] = 18'h20c4f;
      expv[56] = 18'h00281;
      expv[57] = 18'h002b3;
      expv[58] = 18'h001e0;
      expv[59] = 18'h2d6b6;
      expv[60] = 18'h00200;
      expv[61] = 18'h0032f;
      expv[62] = 18'h3d050;
      expv[63] = 18'h00251;
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
