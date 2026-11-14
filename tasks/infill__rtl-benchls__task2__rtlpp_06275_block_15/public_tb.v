// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06275 dut (
    .clk(clk),
    .reset(in_vec[85:85]),
    .sw_reset(in_vec[84:84]),
    .sw_stop(in_vec[83:83]),
    .length(in_vec[82:51]),
    .eop_enabled(in_vec[50:50]),
    .eop(in_vec[49:49]),
    .ready(in_vec[48:48]),
    .valid(in_vec[47:47]),
    .early_termination(in_vec[46:46]),
    .address_in(in_vec[45:14]),
    .write_in(in_vec[13:13]),
    .max_burst_count(in_vec[12:10]),
    .write_fifo_used(in_vec[9:4]),
    .waitrequest(in_vec[3:3]),
    .short_first_access_enable(in_vec[2:2]),
    .short_last_access_enable(in_vec[1:1]),
    .short_first_and_last_access_enable(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h3fa6a86da481a468348ccc;
    stim[1] = 86'h276a1d2251176a27bbe9f2;
    stim[2] = 86'h0bbddd6d55fe9ee7acfd4a;
    stim[3] = 86'h04bb1cff69b3fec68249ef;
    stim[4] = 86'h035af10a2c4c40c03e37dd;
    stim[5] = 86'h0524e87401589e2a532ca7;
    stim[6] = 86'h0fea8eccef7b53ca4c8bc4;
    stim[7] = 86'h09d8c3d218fff4b0619158;
    stim[8] = 86'h0e0a665e5dcaf451cbb813;
    stim[9] = 86'h07e81278abc5a3a66ce7ce;
    stim[10] = 86'h130d38373bdd12ccd8903d;
    stim[11] = 86'h0e8d3a0b819368c0f41f3c;
    stim[12] = 86'h0ce485e59db34ae3fbaa46;
    stim[13] = 86'h1d745a645695c0448d5e9b;
    stim[14] = 86'h08c9a38e33fef277c87341;
    stim[15] = 86'h06d9b796f01facd748c45a;
    stim[16] = 86'h1d46b5682d03b91a9876fc;
    stim[17] = 86'h1f301cfb6d3149962e65ca;
    stim[18] = 86'h1419f76529097afe75ed01;
    stim[19] = 86'h12c6262524143ef3ddeede;
    stim[20] = 86'h0694416c919e747cd5c358;
    stim[21] = 86'h165e39fcaa096965dcbf5f;
    stim[22] = 86'h096c038e81d3d458a76f7c;
    stim[23] = 86'h0c760c71b5666c93d0b92f;
    stim[24] = 86'h1348db366188cd19d293d1;
    stim[25] = 86'h057856971350237c781751;
    stim[26] = 86'h1c385e37aaee814e4f66ba;
    stim[27] = 86'h12c4e39a67c4d4e3f54cbc;
    stim[28] = 86'h195a75c546594af3e4d7f1;
    stim[29] = 86'h0865fb484237a2bc466452;
    stim[30] = 86'h0d66f8d3cadaff7f0a9b9b;
    stim[31] = 86'h04b6bf1ad0dee2c4b22c73;
    stim[32] = 86'h02f0dbc585ada273beff13;
    stim[33] = 86'h1230f374b7ccb80241533e;
    stim[34] = 86'h12f8c265a3f3804e2a34e3;
    stim[35] = 86'h04e025948b377fb3e92065;
    stim[36] = 86'h29cee79fbd700f60ac8e1c;
    stim[37] = 86'h0d1b6e990cba23a3526fbc;
    stim[38] = 86'h1c6714c4dc0f42eda56811;
    stim[39] = 86'h1f13ba57fb9e4f9a455eba;
    stim[40] = 86'h0f9bf84c56ffdfe07ac288;
    stim[41] = 86'h1b0d3e6069fa248305e53f;
    stim[42] = 86'h161d9cd7234bc0a1ac3f38;
    stim[43] = 86'h1b6761f471f70af0869a32;
    stim[44] = 86'h10893f14f64f563107ef27;
    stim[45] = 86'h1d480d02a07ea179b3c7ad;
    stim[46] = 86'h115ab1e72e6d713ef2184a;
    stim[47] = 86'h158a845ceb90c3cbe2a3b2;
    stim[48] = 86'h05ae154f28a265c6da74ac;
    stim[49] = 86'h1f9d00c495d272b2a847bd;
    stim[50] = 86'h17844fd8de17bb4e4d1503;
    stim[51] = 86'h1735ef4a699b1d28649c95;
    stim[52] = 86'h18a3944403cdc8dd21542d;
    stim[53] = 86'h0081f70195dd02269298d0;
    stim[54] = 86'h1dd11cf0b78f6d5f2cfc57;
    stim[55] = 86'h0237a7d6a960012d738989;
    stim[56] = 86'h179660a54542302632cc99;
    stim[57] = 86'h18aa72c0b91f1b0b4f7e7e;
    stim[58] = 86'h01ba2a01fc8ebd18dea5c1;
    stim[59] = 86'h081eb344e2c1805368dbab;
    stim[60] = 86'h026e017b430e8b74f90a1b;
    stim[61] = 86'h1874d7807d23a89251d01c;
    stim[62] = 86'h1ce95cd84a1c8a1c66ca05;
    stim[63] = 86'h156c3e4902d67253d3f73f;
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
      expv[0] = 39'h0000000007;
      expv[1] = 39'h0000000004;
      expv[2] = 39'h0000000005;
      expv[3] = 39'h7d3dcf598c;
      expv[4] = 39'h7d3dcf598c;
      expv[5] = 39'h1881807c48;
      expv[6] = 39'h1881807c0d;
      expv[7] = 39'h1881807c0d;
      expv[8] = 39'h1881807c0d;
      expv[9] = 39'h15e8a3970c;
      expv[10] = 39'h0b474cd9c8;
      expv[11] = 39'h0b474cd9c8;
      expv[12] = 39'h0b474cd9c8;
      expv[13] = 39'h0b474cd98f;
      expv[14] = 39'h0b474cd98d;
      expv[15] = 39'h7de4ef908c;
      expv[16] = 39'h7de4ef908f;
      expv[17] = 39'h077235308f;
      expv[18] = 39'h62932c5c8e;
      expv[19] = 39'h12f5fceb8e;
      expv[20] = 39'h287de7bb8c;
      expv[21] = 39'h287de7bb8e;
      expv[22] = 39'h12d2cbb90d;
      expv[23] = 39'h27a8b14e8d;
      expv[24] = 39'h4cd927a10e;
      expv[25] = 39'h4cd927a10c;
      expv[26] = 39'h4cd927a10f;
      expv[27] = 39'h5d029c9e8e;
      expv[28] = 39'h5d029c9e8f;
      expv[29] = 39'h5d029c9e8d;
      expv[30] = 39'h6f45788c8d;
      expv[31] = 39'h6f45788c8c;
      expv[32] = 39'h3dc5896448;
      expv[33] = 39'h3dc589640e;
      expv[34] = 39'h3dc589640e;
      expv[35] = 39'h67009c540c;
      expv[36] = 39'h0000000005;
      expv[37] = 39'h0000000005;
      expv[38] = 39'h744746a48f;
      expv[39] = 39'h1e85db4a8f;
      expv[40] = 39'h1e85db4a8d;
      expv[41] = 39'h1e85db4a8f;
      expv[42] = 39'h7449060b8e;
      expv[43] = 39'h178143580f;
      expv[44] = 39'h178143580e;
      expv[45] = 39'h1eac620f8f;
      expv[46] = 39'h1eac620f8e;
      expv[47] = 39'h1eac620f8e;
      expv[48] = 39'h218797c50c;
      expv[49] = 39'h44cb8db4c8;
      expv[50] = 39'h44cb8db4c8;
      expv[51] = 39'h44cb8db48e;
      expv[52] = 39'h44cb8db48f;
      expv[53] = 39'h44cb8db48c;
      expv[54] = 39'h44cb8db48f;
      expv[55] = 39'h1edabe598c;
      expv[56] = 39'h1edabe598e;
      expv[57] = 39'h1edabe598f;
      expv[58] = 39'h3e36169e8c;
      expv[59] = 39'h1d7a31bd48;
      expv[60] = 39'h1d7a31bd48;
      expv[61] = 39'h1d7a31bd48;
      expv[62] = 39'h1d7a31bd48;
      expv[63] = 39'h1d7a31bd0e;
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
