// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10178 dut (
    .clk(clk),
    .A(in_vec[64:33]),
    .WD(in_vec[32:1]),
    .WE(in_vec[0:0]),
    .RD(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h027e632bd4ca7a07f;
    stim[1] = 65'h1fef862af2d892566;
    stim[2] = 65'h019031792b7429f93;
    stim[3] = 65'h16839334191595a6c;
    stim[4] = 65'h0354b2236f4290acb;
    stim[5] = 65'h175e9fd9bf41fd456;
    stim[6] = 65'h17d072fc0484afc96;
    stim[7] = 65'h1ac3efb55e51fd368;
    stim[8] = 65'h19287445ed808d2fa;
    stim[9] = 65'h03f901adaacf4eefb;
    stim[10] = 65'h1eb4d04b4efa16d83;
    stim[11] = 65'h1c37fe71624714a61;
    stim[12] = 65'h1c3158f00e20fe183;
    stim[13] = 65'h030ba92c33a891285;
    stim[14] = 65'h13a1f2a56038b0902;
    stim[15] = 65'h07dcc5d7278df9f15;
    stim[16] = 65'h16457cf627c4fb8be;
    stim[17] = 65'h00cb64a3c264c75d2;
    stim[18] = 65'h16a0c6e7803194131;
    stim[19] = 65'h096739da537ce7829;
    stim[20] = 65'h1e2555f7e7d513235;
    stim[21] = 65'h009c5fe9fc5a772d6;
    stim[22] = 65'h0e86e12b011a99815;
    stim[23] = 65'h03542c7e017c62dfe;
    stim[24] = 65'h075dae905d42e05e2;
    stim[25] = 65'h16dfe8a3330ee6b92;
    stim[26] = 65'h16b99e1b0a52da48f;
    stim[27] = 65'h1ce601091c2286920;
    stim[28] = 65'h0a5620fb08f63ec66;
    stim[29] = 65'h0a6003be0c71c18a0;
    stim[30] = 65'h0cbe0fb9a96561cd7;
    stim[31] = 65'h1c653b39fc5d95288;
    stim[32] = 65'h1bf6df6950ec57123;
    stim[33] = 65'h1c821a84ee4a910d6;
    stim[34] = 65'h00eca5fbaa316c0f7;
    stim[35] = 65'h0e267881d9c47ef81;
    stim[36] = 65'h1cfe570438873c4a7;
    stim[37] = 65'h1e91a69380685f1c1;
    stim[38] = 65'h0df0d7f92886b35b2;
    stim[39] = 65'h1446c881c50a2aaf4;
    stim[40] = 65'h080a8159299029843;
    stim[41] = 65'h189aa1167814e85b0;
    stim[42] = 65'h01f36f781b3955790;
    stim[43] = 65'h060490ffa8129de1b;
    stim[44] = 65'h0700c4275713f4666;
    stim[45] = 65'h0893a4d38b89aa539;
    stim[46] = 65'h15a6923f11546d494;
    stim[47] = 65'h1be4e14b424e197fa;
    stim[48] = 65'h0ab71b18c47ac5def;
    stim[49] = 65'h05887ff172235dd12;
    stim[50] = 65'h0dee5463a0ae1d8d5;
    stim[51] = 65'h0c9975c6a664e19eb;
    stim[52] = 65'h1d5b6787e07349511;
    stim[53] = 65'h0a99a9397805e98dd;
    stim[54] = 65'h0506a4dddf6eb45b6;
    stim[55] = 65'h12a706815ac9906e4;
    stim[56] = 65'h1f4a8a33948ff7407;
    stim[57] = 65'h06024e206c98629fd;
    stim[58] = 65'h1d2b1aa03d309d408;
    stim[59] = 65'h194bbd6ded39433dd;
    stim[60] = 65'h0b39f90b1674f78fd;
    stim[61] = 65'h0492f3fc2bd1f2e93;
    stim[62] = 65'h07e893ab0c4823787;
    stim[63] = 65'h1e1ce8e03cb40e180;
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
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
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
      expv[20] = 32'h018ca098;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'h77d0b6c1;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'h7107f0c1;
      expv[25] = 32'h7a148565;
      expv[26] = 32'h08d4cc0a;
      expv[27] = 32'h5ba14fc9;
      expv[28] = 32'h5296d247;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'h4b2b0e6b;
      expv[32] = 32'h5ba14fc9;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'ha653d03f;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'h8762b891;
      expv[39] = 32'hce23f7c0;
      expv[40] = 32'h8762b891;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'h3c6fcf8a;
      expv[45] = 32'h0342f8e0;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h5296d247;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'h1238a530;
      expv[50] = 32'h5c4d529c;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'h3ea8991a;
      expv[53] = 32'h4c814c21;
      expv[54] = 32'h567a777d;
      expv[55] = 32'h1238a530;
      expv[56] = 32'h0570ec6a;
      expv[57] = 32'h7107f0c1;
      expv[58] = 32'h64c314fe;
      expv[59] = 32'h567a777d;
      expv[60] = 32'h5296d247;
      expv[61] = 32'h9d448942;
      expv[62] = 32'hb3a7bc7e;
      expv[63] = 32'h64c314fe;
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
