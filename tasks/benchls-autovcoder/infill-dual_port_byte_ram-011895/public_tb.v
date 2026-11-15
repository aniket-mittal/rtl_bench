// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011895 dut (
    .clk(clk),
    .addr1(in_vec[37:32]),
    .addr2(in_vec[31:26]),
    .be1(in_vec[25:22]),
    .be2(in_vec[21:18]),
    .data_in1(in_vec[17:10]),
    .data_in2(in_vec[9:2]),
    .we1(in_vec[1:1]),
    .we2(in_vec[0:0]),
    .data_out1(out_vec[63:32]),
    .data_out2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h342fb3ffd2;
    stim[1] = 38'h3d9782f038;
    stim[2] = 38'h0de4d4d3b3;
    stim[3] = 38'h17d2900594;
    stim[4] = 38'h3f1f0ff284;
    stim[5] = 38'h28435123bb;
    stim[6] = 38'h3f5467f845;
    stim[7] = 38'h3d077cae46;
    stim[8] = 38'h3e334ec5cd;
    stim[9] = 38'h3b26b97f93;
    stim[10] = 38'h12422399b2;
    stim[11] = 38'h306d3b3a2a;
    stim[12] = 38'h03b337957d;
    stim[13] = 38'h043610c827;
    stim[14] = 38'h31a4640591;
    stim[15] = 38'h3518fccd11;
    stim[16] = 38'h155708d406;
    stim[17] = 38'h1953adcfc6;
    stim[18] = 38'h2be0853e68;
    stim[19] = 38'h1e4f706367;
    stim[20] = 38'h2f275db6fd;
    stim[21] = 38'h017dc451fc;
    stim[22] = 38'h04ff072d36;
    stim[23] = 38'h3e73c5ff42;
    stim[24] = 38'h0d6def5d41;
    stim[25] = 38'h2c42d0b1cd;
    stim[26] = 38'h1adc367e9d;
    stim[27] = 38'h30a9a965a7;
    stim[28] = 38'h00c57eb435;
    stim[29] = 38'h36cdf4ab5b;
    stim[30] = 38'h2fc5285acb;
    stim[31] = 38'h1eb878f69b;
    stim[32] = 38'h2f82ba9e69;
    stim[33] = 38'h06ca2377bc;
    stim[34] = 38'h375fb6842e;
    stim[35] = 38'h1fe5c10e75;
    stim[36] = 38'h07d347e7c7;
    stim[37] = 38'h1b091cd575;
    stim[38] = 38'h39477a453c;
    stim[39] = 38'h3584eaa766;
    stim[40] = 38'h2097b0d5fd;
    stim[41] = 38'h0672df4897;
    stim[42] = 38'h210e385128;
    stim[43] = 38'h369d51eb6e;
    stim[44] = 38'h30b91a793a;
    stim[45] = 38'h0a4d299377;
    stim[46] = 38'h3fc45cea67;
    stim[47] = 38'h03eae08afe;
    stim[48] = 38'h0a7cb2419e;
    stim[49] = 38'h15fddbd982;
    stim[50] = 38'h187771fe99;
    stim[51] = 38'h05f08ac7a9;
    stim[52] = 38'h17c00160e3;
    stim[53] = 38'h0c4ef7868b;
    stim[54] = 38'h3020c67af2;
    stim[55] = 38'h3d77aa5426;
    stim[56] = 38'h1bbf1276b0;
    stim[57] = 38'h3e9efdb164;
    stim[58] = 38'h35fde5c493;
    stim[59] = 38'h21f1fc77db;
    stim[60] = 38'h37a6beb640;
    stim[61] = 38'h3551ef42ad;
    stim[62] = 38'h023a36826e;
    stim[63] = 38'h15c1722d25;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxffffffxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxeexxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxx3434;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'h11xxxx1111xxxx11;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxe4e4e4xx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'h32xxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxx093434xxxxxxxx;
      expv[26] = 64'h5f5fxx5fxxeexxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxcexxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxx0d0d0d0d;
      expv[32] = 64'h1818xx18xxxxxxxx;
      expv[33] = 64'hxx16xxxxxxxxxxxx;
      expv[34] = 64'h44444444xxxxxxxx;
      expv[35] = 64'ha7a7xxa7xxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxecxxec;
      expv[37] = 64'hxxxxxxxxffffffxx;
      expv[38] = 64'h50xx5050xxxxxxxx;
      expv[39] = 64'hxxecxxecxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'h9a9a9axxxxxxxxxx;
      expv[42] = 64'h44444444xxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxx2a2a2axxxxxxxx;
      expv[45] = 64'hxx5959xxa6a6a6xx;
      expv[46] = 64'hxxxxxxxxd9d9xxxx;
      expv[47] = 64'hxxxxxxxxb20db20d;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxx64xxxxxxxxxxxx;
      expv[50] = 64'h3535xx11xxxxxx3a;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxx9e59xx;
      expv[54] = 64'hxxxx7373ddd9ddxx;
      expv[55] = 64'hxx9e59xxxxxxxxxx;
      expv[56] = 64'h2b2bxx2ba6a6xxxx;
      expv[57] = 64'h50xx5050xx16xxxx;
      expv[58] = 64'h7f7f7f7fxxxxxxxx;
      expv[59] = 64'hxxxxa9a9xxxxxx3a;
      expv[60] = 64'hxxxxxxxxxxxxeaxx;
      expv[61] = 64'ha1a1a1a764xxxx64;
      expv[62] = 64'hxx717171xxxxxxxx;
      expv[63] = 64'hxx5d5d5dxxxxxxxx;
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
