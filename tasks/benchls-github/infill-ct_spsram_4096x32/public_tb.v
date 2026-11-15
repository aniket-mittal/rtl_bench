// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_spsram_4096x32 dut (
    .CLK(clk),
    .A(in_vec[77:66]),
    .CEN(in_vec[65:65]),
    .D(in_vec[64:33]),
    .GWEN(in_vec[32:32]),
    .WEN(in_vec[31:0]),
    .Q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h02c4e33d5c0c5be4de6b;
    stim[1] = 78'h28f67bea04fbeef4eb65;
    stim[2] = 78'h35f6eacb678de3edb9dc;
    stim[3] = 78'h29a63c8077254f8053ac;
    stim[4] = 78'h253326e248878fd80363;
    stim[5] = 78'h1d7fbb19a53bbb2f874a;
    stim[6] = 78'h2a112e718457a4e22eed;
    stim[7] = 78'h3dea86101df069255656;
    stim[8] = 78'h217691aa46266e9540b2;
    stim[9] = 78'h1ffed31c20ecb691a0b0;
    stim[10] = 78'h0614fd5faf4bb560fbcc;
    stim[11] = 78'h29c0cd2e827e8b3986b5;
    stim[12] = 78'h3e41da3abaf2c50b6833;
    stim[13] = 78'h043818b29b2110498ac3;
    stim[14] = 78'h2f8db613a041f291de8c;
    stim[15] = 78'h28bccf1d0ad1ca808473;
    stim[16] = 78'h1ceeb7eb7a257fe31fea;
    stim[17] = 78'h3c667f8b77ee95d1be0b;
    stim[18] = 78'h3f10c369547d87a4db1e;
    stim[19] = 78'h3dc29271498af41eef63;
    stim[20] = 78'h09925910d993a9482a05;
    stim[21] = 78'h1a2215f6e5af9c492d0f;
    stim[22] = 78'h123d870b921baff71560;
    stim[23] = 78'h37011e8070a89d94ec87;
    stim[24] = 78'h1a80048d31824371e32a;
    stim[25] = 78'h1667194f0fe1a73cef0a;
    stim[26] = 78'h3bda8b09f070b5d6a083;
    stim[27] = 78'h39509745f7be231b7e1b;
    stim[28] = 78'h1e2dfee2787c9b5019f2;
    stim[29] = 78'h314f2b15f9ddd31f7ada;
    stim[30] = 78'h2cf9dc30ebdbc7465d29;
    stim[31] = 78'h1cd177009ac2e7678f7d;
    stim[32] = 78'h13b43fca73f02116927c;
    stim[33] = 78'h361ca29a9408da75d533;
    stim[34] = 78'h1039293cb744f30ae985;
    stim[35] = 78'h1e2de9e12a3883c60912;
    stim[36] = 78'h31af36c38ede9e014928;
    stim[37] = 78'h1357d5e0e8c5eeab4726;
    stim[38] = 78'h3c5afe0d39d55901b8d1;
    stim[39] = 78'h3e5de6ea6b992d5a9caa;
    stim[40] = 78'h102a1a70f36713c5a636;
    stim[41] = 78'h195619ced42cd7d6b377;
    stim[42] = 78'h26a734aaed4160362561;
    stim[43] = 78'h1bd4ddf104a98852dc46;
    stim[44] = 78'h17172278c89b1c862571;
    stim[45] = 78'h3e55f96532b1f31e8c25;
    stim[46] = 78'h07d6dc9fdb8910c9311a;
    stim[47] = 78'h1edac14da84051767659;
    stim[48] = 78'h30220722e83e0875716d;
    stim[49] = 78'h09016e80da9aa8081f13;
    stim[50] = 78'h2a8d0a9381371f1848bc;
    stim[51] = 78'h37fb5a38ce49388abee3;
    stim[52] = 78'h319b1aee5c36ab1b9390;
    stim[53] = 78'h123e2fac715a15482ed0;
    stim[54] = 78'h02794fc984b7f4013d9b;
    stim[55] = 78'h2137e9b21bb1ba528818;
    stim[56] = 78'h3c60df0710909e6fdce0;
    stim[57] = 78'h0dd3852f1563ce18fb85;
    stim[58] = 78'h275ae04065081b93113b;
    stim[59] = 78'h28d4f6585be1c9b42867;
    stim[60] = 78'h27ba43c2c4e1e4d2846d;
    stim[61] = 78'h2b546b75d27c5aec9017;
    stim[62] = 78'h184b9b8b5744449f28b0;
    stim[63] = 78'h2cef474099af08c8d3a7;
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
      expv[1] = 32'h71xxxx06;
      expv[2] = 32'h71xxxx06;
      expv[3] = 32'h71xxxx06;
      expv[4] = 32'h71xxxx06;
      expv[5] = 32'h71xxxx06;
      expv[6] = 32'h71xxxx06;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxx97xxxx;
      expv[13] = 32'hxx1d5d79;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'h0246xxc1;
      expv[26] = 32'h0246xxc1;
      expv[27] = 32'h0246xxc1;
      expv[28] = 32'h4ba2fbdf;
      expv[29] = 32'hxx713cxx;
      expv[30] = 32'hxx713cxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxx80xx61;
      expv[33] = 32'h1fe5xxf8;
      expv[34] = 32'hxx4dxx04;
      expv[35] = 32'hxx9exxxx;
      expv[36] = 32'hxx71951c;
      expv[37] = 32'hxx71951c;
      expv[38] = 32'hxx71951c;
      expv[39] = 32'hxx71951c;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxx406d4d;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxx83xxxx;
      expv[58] = 32'hxx83xxxx;
      expv[59] = 32'hxx83xxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'h35xxxx3e;
      expv[63] = 32'h35xxxx3e;
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
