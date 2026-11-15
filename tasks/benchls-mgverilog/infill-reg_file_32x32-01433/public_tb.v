// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01433 dut (
    .clk(clk),
    .rna(in_vec[48:44]),
    .rnb(in_vec[43:39]),
    .d(in_vec[38:7]),
    .wn(in_vec[6:2]),
    .we(in_vec[1:1]),
    .clrn(in_vec[0:0]),
    .qa(out_vec[63:32]),
    .qb(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h01bc057676832;
    stim[1] = 49'h1cdf7e8204342;
    stim[2] = 49'h1fc219b89f9bd;
    stim[3] = 49'h1a35f1341f6a3;
    stim[4] = 49'h17272d91fa663;
    stim[5] = 49'h1b44e3bdac557;
    stim[6] = 49'h0f89dd5eec659;
    stim[7] = 49'h1d77a3b6f64bb;
    stim[8] = 49'h0b4054d9e4225;
    stim[9] = 49'h0b238263f21e5;
    stim[10] = 49'h0695b3631636b;
    stim[11] = 49'h1f9859ef98eb1;
    stim[12] = 49'h14b548f5ec9c5;
    stim[13] = 49'h12489ca34a5d9;
    stim[14] = 49'h1172b053c5615;
    stim[15] = 49'h11ef73debf301;
    stim[16] = 49'h107e395ce62cf;
    stim[17] = 49'h1785848952a81;
    stim[18] = 49'h010dfb9a7b711;
    stim[19] = 49'h0fb31c36e7435;
    stim[20] = 49'h0600f93b74d2f;
    stim[21] = 49'h0720c6533e3d3;
    stim[22] = 49'h1c6dcf1befb79;
    stim[23] = 49'h1c4ffcd587fbd;
    stim[24] = 49'h04c75b759dcd6;
    stim[25] = 49'h13be31b0932cf;
    stim[26] = 49'h176425d4c4f89;
    stim[27] = 49'h02d4acd495c4f;
    stim[28] = 49'h1d6c497b3a3d9;
    stim[29] = 49'h10fe564ee2f1d;
    stim[30] = 49'h1a698cd627523;
    stim[31] = 49'h1ea8c5b671b35;
    stim[32] = 49'h01911d22087c5;
    stim[33] = 49'h043836a08f4f5;
    stim[34] = 49'h1cef209f8223a;
    stim[35] = 49'h049a92aa945f5;
    stim[36] = 49'h1f768c4e92fdc;
    stim[37] = 49'h1e2017c730375;
    stim[38] = 49'h1e21552cc88bf;
    stim[39] = 49'h1f69c4d564081;
    stim[40] = 49'h1ab20161e4139;
    stim[41] = 49'h0d7cb81a3ec2d;
    stim[42] = 49'h1e1abd7ec4433;
    stim[43] = 49'h0f3d476c4835b;
    stim[44] = 49'h0b448de277e0b;
    stim[45] = 49'h162c4abc98569;
    stim[46] = 49'h16f8c1850f08d;
    stim[47] = 49'h1819396009ca1;
    stim[48] = 49'h0f4d9e2b558d1;
    stim[49] = 49'h126d832e121b3;
    stim[50] = 49'h08eaef766fd43;
    stim[51] = 49'h032f7067b3881;
    stim[52] = 49'h02f634f6ae377;
    stim[53] = 49'h03fbfdf6d8789;
    stim[54] = 49'h097cba1fd55b5;
    stim[55] = 49'h07fcc25d513c3;
    stim[56] = 49'h1afbe808f5e1f;
    stim[57] = 49'h15ebd6ac2c865;
    stim[58] = 49'h0a870a86c519b;
    stim[59] = 49'h16bc092407b89;
    stim[60] = 49'h01172abd6577f;
    stim[61] = 49'h01af68aa72403;
    stim[62] = 49'h1da08d30651ab;
    stim[63] = 49'h108ed16f7c1f1;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h00000000be2683ed;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h00000000be2683ed;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h00000000f476dec9;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h000000002aa59911;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h2aa5991100000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'ha8ed890600000000;
      expv[46] = 64'ha8ed890600000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h2aa5991100000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h91bc4efc00000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h000000002aa59911;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h00000000c69ed5c6;
      expv[58] = 64'h00000000984baa27;
      expv[59] = 64'ha8ed890600000000;
      expv[60] = 64'h0000000091bc4efc;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'hc69ed5c600000000;
      expv[63] = 64'h984baa2700000000;
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
