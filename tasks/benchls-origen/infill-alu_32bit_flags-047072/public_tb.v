// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_047072 dut (
    .opA(in_vec[66:35]),
    .opB(in_vec[34:3]),
    .sel(in_vec[2:0]),
    .res(out_vec[34:3]),
    .z(out_vec[2:2]),
    .c(out_vec[1:1]),
    .v(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h30581dd80e019d1e2;
    stim[1] = 67'h2ecf2b7284b759ae8;
    stim[2] = 67'h2eea3ba8d68ea9733;
    stim[3] = 67'h7ef71bc05831cb1a6;
    stim[4] = 67'h5400a6ed3a6e943a9;
    stim[5] = 67'h32909c42fb6259e65;
    stim[6] = 67'h02af8a06e82a08614;
    stim[7] = 67'h2f1f763f55692686d;
    stim[8] = 67'h60a2656d712ab5c23;
    stim[9] = 67'h39f8a3679fa328608;
    stim[10] = 67'h647e2457561314380;
    stim[11] = 67'h32a5b63a8221fa6cb;
    stim[12] = 67'h44335552074526dda;
    stim[13] = 67'h718e15d41ce329fca;
    stim[14] = 67'h35b49d9991eecc8cb;
    stim[15] = 67'h3abbdd439b880653f;
    stim[16] = 67'h5487f756415dd257a;
    stim[17] = 67'h195657e3d3f29d125;
    stim[18] = 67'h13650ed021da433a0;
    stim[19] = 67'h1fdedbef22c1d8de0;
    stim[20] = 67'h72952b5b15b7b4dc2;
    stim[21] = 67'h36db101259a90d7af;
    stim[22] = 67'h1ce84303de0d0345c;
    stim[23] = 67'h2b73ecd13e3d9e10d;
    stim[24] = 67'h3d5470fa8d0ec41cd;
    stim[25] = 67'h2418b8209d5ca8efd;
    stim[26] = 67'h654432a2fe8349514;
    stim[27] = 67'h364a3887cfc36a728;
    stim[28] = 67'h560d9ce3f4f51e42c;
    stim[29] = 67'h79097f47443dc40af;
    stim[30] = 67'h497d10a47477c37b1;
    stim[31] = 67'h5fec5797e7b188926;
    stim[32] = 67'h7cc74ad4c41c35157;
    stim[33] = 67'h62b3386193c404d96;
    stim[34] = 67'h189fbdbd25fb8a4ae;
    stim[35] = 67'h6a44f231d65d30497;
    stim[36] = 67'h7b99572caffa02bf5;
    stim[37] = 67'h188a91069aad63759;
    stim[38] = 67'h30fd2e329a2034312;
    stim[39] = 67'h0b4801db0461ea8cb;
    stim[40] = 67'h3cc68948b54ca529a;
    stim[41] = 67'h753856c2a6e0c686c;
    stim[42] = 67'h0bfcb27c3c139d8ce;
    stim[43] = 67'h0a0fa43cbbceff8c9;
    stim[44] = 67'h59084c7ed747866b3;
    stim[45] = 67'h3d54a340d7759ca85;
    stim[46] = 67'h31d0849ffee3323da;
    stim[47] = 67'h28489b9a631a6e1cd;
    stim[48] = 67'h0e19a8ac2238330bf;
    stim[49] = 67'h2229468d992cb0f17;
    stim[50] = 67'h495beef12c534ec8e;
    stim[51] = 67'h52fe1f5a194af99ed;
    stim[52] = 67'h53a100a9ed266b380;
    stim[53] = 67'h6c7804bfd2295df4d;
    stim[54] = 67'h6bbf41f90b964fc6f;
    stim[55] = 67'h177278204006cdac6;
    stim[56] = 67'h41f36c288851def37;
    stim[57] = 67'h6d2012cb74d4ea355;
    stim[58] = 67'h50b8e96c8822af430;
    stim[59] = 67'h38d1ade70038b905c;
    stim[60] = 67'h0517fbb18d7867223;
    stim[61] = 67'h02b87aec938eb2ec1;
    stim[62] = 67'h16e984b96b5ca25ee;
    stim[63] = 67'h5eae2e9d65c248711;
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
      expv[0] = 35'h00001d180;
      expv[1] = 35'h338685210;
      expv[2] = 35'h7eeebbfb8;
      expv[3] = 35'h000000004;
      expv[4] = 35'h199212b2b;
      expv[5] = 35'h000000004;
      expv[6] = 35'h7d5075f90;
      expv[7] = 35'h000000004;
      expv[8] = 35'h71aaf5ef0;
      expv[9] = 35'h599bcbc81;
      expv[10] = 35'h3a91388f3;
      expv[11] = 35'h32a5fe7e8;
      expv[12] = 35'h040104500;
      expv[13] = 35'h108201d40;
      expv[14] = 35'h35fedd9d8;
      expv[15] = 35'h000000004;
      expv[16] = 35'h4005d2560;
      expv[17] = 35'h000000004;
      expv[18] = 35'h353f520a0;
      expv[19] = 35'h42a0b4cd1;
      expv[20] = 35'h109520580;
      expv[21] = 35'h000000004;
      expv[22] = 35'h6317bcfc0;
      expv[23] = 35'h000000004;
      expv[24] = 35'h000000004;
      expv[25] = 35'h000000004;
      expv[26] = 35'h1abbcd5d0;
      expv[27] = 35'h060da2fa2;
      expv[28] = 35'h29f2631c0;
      expv[29] = 35'h000000004;
      expv[30] = 35'h55054d290;
      expv[31] = 35'h000000004;
      expv[32] = 35'h000000004;
      expv[33] = 35'h000000004;
      expv[34] = 35'h000000004;
      expv[35] = 35'h000000004;
      expv[36] = 35'h000000004;
      expv[37] = 35'h7ddd2d910;
      expv[38] = 35'h102024300;
      expv[39] = 35'h0f69ebdf8;
      expv[40] = 35'h344481088;
      expv[41] = 35'h0ac7a93d0;
      expv[42] = 35'h000000004;
      expv[43] = 35'h4e40a4b00;
      expv[44] = 35'h5f4fce7f8;
      expv[45] = 35'h000000004;
      expv[46] = 35'h30c0001d8;
      expv[47] = 35'h000000004;
      expv[48] = 35'h000000004;
      expv[49] = 35'h000000004;
      expv[50] = 35'h000000004;
      expv[51] = 35'h000000004;
      expv[52] = 35'h40c76be1a;
      expv[53] = 35'h000000004;
      expv[54] = 35'h000000004;
      expv[55] = 35'h000000004;
      expv[56] = 35'h000000004;
      expv[57] = 35'h000000004;
      expv[58] = 35'h58db98af8;
      expv[59] = 35'h472e52188;
      expv[60] = 35'h0d7fffb38;
      expv[61] = 35'h6f29c8008;
      expv[62] = 35'h000000004;
      expv[63] = 35'h78ebe62c0;
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
