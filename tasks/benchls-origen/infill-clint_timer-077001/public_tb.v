// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_077001 dut (
    .clk(clk),
    .rst_n(in_vec[38:38]),
    .wr_H_rd_L(in_vec[37:37]),
    .load(in_vec[36:36]),
    .addr(in_vec[35:32]),
    .wdata(in_vec[31:0]),
    .rdata(out_vec[33:2]),
    .time_interrupt(out_vec[1:1]),
    .msip_reg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h3a2272e1b0;
    stim[1] = 39'h16e195387f;
    stim[2] = 39'h72babeb530;
    stim[3] = 39'h5dfaf82f58;
    stim[4] = 39'h4fa16ebfc6;
    stim[5] = 39'h40aa213f53;
    stim[6] = 39'h43507715a7;
    stim[7] = 39'h55873ef6cd;
    stim[8] = 39'h6b9bdd1426;
    stim[9] = 39'h54e0c7d424;
    stim[10] = 39'h4acb9cdd14;
    stim[11] = 39'h39b5f1257f;
    stim[12] = 39'h406415f0b1;
    stim[13] = 39'h416959ef2c;
    stim[14] = 39'h4dbd23c56d;
    stim[15] = 39'h4ed452f3b4;
    stim[16] = 39'h65c903827b;
    stim[17] = 39'h6532dd9ac5;
    stim[18] = 39'h6051912ef9;
    stim[19] = 39'h56572e3427;
    stim[20] = 39'h4cf6168715;
    stim[21] = 39'h0178673d27;
    stim[22] = 39'h56b4635088;
    stim[23] = 39'h4541e1e343;
    stim[24] = 39'h3f9358cb37;
    stim[25] = 39'h6260efd230;
    stim[26] = 39'h4fc6bb075e;
    stim[27] = 39'h467a5cd2b4;
    stim[28] = 39'h69dcd84445;
    stim[29] = 39'h6e18ad8b08;
    stim[30] = 39'h77e90150eb;
    stim[31] = 39'h4ddae4a7f8;
    stim[32] = 39'h7a21d236ec;
    stim[33] = 39'h704c31887f;
    stim[34] = 39'h75e2559d7e;
    stim[35] = 39'h6eb179b169;
    stim[36] = 39'h621ea1eeaf;
    stim[37] = 39'h538abe2946;
    stim[38] = 39'h721bc5c99e;
    stim[39] = 39'h440aead776;
    stim[40] = 39'h76e6157c1d;
    stim[41] = 39'h772305bcfb;
    stim[42] = 39'h6594f3101b;
    stim[43] = 39'h5b4ebcee90;
    stim[44] = 39'h4e459e6427;
    stim[45] = 39'h7e27a69b65;
    stim[46] = 39'h5dccdf872c;
    stim[47] = 39'h680a019f22;
    stim[48] = 39'h4f29c2a144;
    stim[49] = 39'h60b2fdf21e;
    stim[50] = 39'h4e5a34e2e3;
    stim[51] = 39'h54d94c5e77;
    stim[52] = 39'h7bb51f6940;
    stim[53] = 39'h5b3f5707d4;
    stim[54] = 39'h479df203b9;
    stim[55] = 39'h508c0485ae;
    stim[56] = 39'h6cfcef050b;
    stim[57] = 39'h50e61bee34;
    stim[58] = 39'h6f114cf6fd;
    stim[59] = 39'h76aedf16cc;
    stim[60] = 39'h7b2cf515e2;
    stim[61] = 39'h6d859be31c;
    stim[62] = 39'h598e3cb574;
    stim[63] = 39'h72a95b475b;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h3fffffffc;
      expv[9] = 34'h3fffffffc;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h3fffffffc;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h3fffffffc;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h3fffffffc;
      expv[29] = 34'h3fffffffd;
      expv[30] = 34'h3fffffffd;
      expv[31] = 34'h3fffffffd;
      expv[32] = 34'h000000001;
      expv[33] = 34'h000000001;
      expv[34] = 34'h000000001;
      expv[35] = 34'h000000001;
      expv[36] = 34'h000000001;
      expv[37] = 34'h000000001;
      expv[38] = 34'h000000001;
      expv[39] = 34'h000000001;
      expv[40] = 34'h000000001;
      expv[41] = 34'h000000001;
      expv[42] = 34'h000000001;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000001;
      expv[45] = 34'h000000001;
      expv[46] = 34'h000000001;
      expv[47] = 34'h000000001;
      expv[48] = 34'h000000001;
      expv[49] = 34'h000000001;
      expv[50] = 34'h000000001;
      expv[51] = 34'h000000001;
      expv[52] = 34'h000000009;
      expv[53] = 34'h000000009;
      expv[54] = 34'h000000001;
      expv[55] = 34'h08c16f3ed;
      expv[56] = 34'h2cbf7c879;
      expv[57] = 34'h2cbf7c879;
      expv[58] = 34'h2cbf7c879;
      expv[59] = 34'h2cbf7c879;
      expv[60] = 34'h2cbf7c879;
      expv[61] = 34'h2cbf7c879;
      expv[62] = 34'h2cbf7c879;
      expv[63] = 34'h000000005;
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
