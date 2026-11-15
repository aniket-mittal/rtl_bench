// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04856 dut (
    .clk(clk),
    .ce(in_vec[33:33]),
    .a(in_vec[32:25]),
    .b(in_vec[24:0]),
    .p(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h1f65c03c3;
    stim[1] = 34'h201992acf;
    stim[2] = 34'h3468d0a37;
    stim[3] = 34'h1ee7bcea6;
    stim[4] = 34'h13f21db83;
    stim[5] = 34'h2b12f08f5;
    stim[6] = 34'h21c4b41f3;
    stim[7] = 34'h367f8b15d;
    stim[8] = 34'h16eaf7688;
    stim[9] = 34'h277b415c3;
    stim[10] = 34'h2d72e26fa;
    stim[11] = 34'h1c0866163;
    stim[12] = 34'h173c22944;
    stim[13] = 34'h0317036cc;
    stim[14] = 34'h256a5622d;
    stim[15] = 34'h1daa432b8;
    stim[16] = 34'h21b5948ed;
    stim[17] = 34'h3280306d8;
    stim[18] = 34'h3fc772e7f;
    stim[19] = 34'h2ac978e92;
    stim[20] = 34'h37d9fb44f;
    stim[21] = 34'h169408edd;
    stim[22] = 34'h2cf153f68;
    stim[23] = 34'h2200e92a5;
    stim[24] = 34'h0cb127212;
    stim[25] = 34'h01db4d8ad;
    stim[26] = 34'h154fb2498;
    stim[27] = 34'h106f77b27;
    stim[28] = 34'h34f1333a2;
    stim[29] = 34'h10f70b6aa;
    stim[30] = 34'h1cf856965;
    stim[31] = 34'h195d28d05;
    stim[32] = 34'h3ea60f690;
    stim[33] = 34'h14febef91;
    stim[34] = 34'h1052a9a0b;
    stim[35] = 34'h06111994e;
    stim[36] = 34'h331154b40;
    stim[37] = 34'h343504c7a;
    stim[38] = 34'h20b0b4ad2;
    stim[39] = 34'h12f331cea;
    stim[40] = 34'h03829617f;
    stim[41] = 34'h1b583c6fb;
    stim[42] = 34'h24728df5b;
    stim[43] = 34'h38192ad9c;
    stim[44] = 34'h24fd16fc5;
    stim[45] = 34'h2fbcdb75c;
    stim[46] = 34'h01d126d7f;
    stim[47] = 34'h3fbe13120;
    stim[48] = 34'h01f9ab8d8;
    stim[49] = 34'h2925735d3;
    stim[50] = 34'h2d0a94094;
    stim[51] = 34'h00fdb49c3;
    stim[52] = 34'h1ca7f74ac;
    stim[53] = 34'h1a8318973;
    stim[54] = 34'h2a03deffb;
    stim[55] = 34'h10d5f45d3;
    stim[56] = 34'h06a6e6501;
    stim[57] = 34'h1d946bc83;
    stim[58] = 34'h2ed204c44;
    stim[59] = 34'h37a6401ba;
    stim[60] = 34'h2942e0fbb;
    stim[61] = 34'h1a1df455d;
    stim[62] = 34'h221cf0b5b;
    stim[63] = 34'h202cc3585;
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
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h59cd8105;
      expv[7] = 32'h682b1438;
      expv[8] = 32'h041d9b4a;
      expv[9] = 32'h041d9b4a;
      expv[10] = 32'h60e40407;
      expv[11] = 32'h648103f1;
      expv[12] = 32'h648103f1;
      expv[13] = 32'h648103f1;
      expv[14] = 32'h648103f1;
      expv[15] = 32'h7e4a4a7e;
      expv[16] = 32'h7e4a4a7e;
      expv[17] = 32'h1bc77d8f;
      expv[18] = 32'h1188b409;
      expv[19] = 32'h01bff4e0;
      expv[20] = 32'h76402202;
      expv[21] = 32'h32e9e50c;
      expv[22] = 32'h32e9e50c;
      expv[23] = 32'h3487d2a2;
      expv[24] = 32'h6f8c82d8;
      expv[25] = 32'h6f8c82d8;
      expv[26] = 32'h6f8c82d8;
      expv[27] = 32'h6f8c82d8;
      expv[28] = 32'h6f8c82d8;
      expv[29] = 32'h00e92a50;
      expv[30] = 32'h00e92a50;
      expv[31] = 32'h00e92a50;
      expv[32] = 32'h00e92a50;
      expv[33] = 32'hb386aeae;
      expv[34] = 32'hb386aeae;
      expv[35] = 32'hb386aeae;
      expv[36] = 32'hb386aeae;
      expv[37] = 32'h5ccbf7d0;
      expv[38] = 32'ha4a4ae00;
      expv[39] = 32'hd38018ba;
      expv[40] = 32'hd38018ba;
      expv[41] = 32'hd38018ba;
      expv[42] = 32'hd38018ba;
      expv[43] = 32'h0538761a;
      expv[44] = 32'h28968971;
      expv[45] = 32'h2e023500;
      expv[46] = 32'h46e80703;
      expv[47] = 32'h46e80703;
      expv[48] = 32'he17287ec;
      expv[49] = 32'he17287ec;
      expv[50] = 32'hdb8d8ca0;
      expv[51] = 32'h18de592b;
      expv[52] = 32'h18de592b;
      expv[53] = 32'h18de592b;
      expv[54] = 32'h18de592b;
      expv[55] = 32'h44c23c20;
      expv[56] = 32'h44c23c20;
      expv[57] = 32'h44c23c20;
      expv[58] = 32'h44c23c20;
      expv[59] = 32'h135afe70;
      expv[60] = 32'h84e32758;
      expv[61] = 32'h49d54652;
      expv[62] = 32'h49d54652;
      expv[63] = 32'h0d508c0e;
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
