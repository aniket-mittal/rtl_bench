// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01154 dut (
    .din(in_vec[59:0]),
    .dout(out_vec[67:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'hbf3ada30924b4c9;
    stim[1] = 60'hf12ea5da1b5afcf;
    stim[2] = 60'h4ae7aa6676db621;
    stim[3] = 60'h8d82f3c7e10a78a;
    stim[4] = 60'h39809b5d7ba00c6;
    stim[5] = 60'h1aaca4519270609;
    stim[6] = 60'hfda78eeb373369e;
    stim[7] = 60'h32cf633b3fd5304;
    stim[8] = 60'ha1a42cf47df81ae;
    stim[9] = 60'h7b49d05a3ae2580;
    stim[10] = 60'h64993d69f7c3cd8;
    stim[11] = 60'h018e4994073ab12;
    stim[12] = 60'he8f52cebe0c0ad1;
    stim[13] = 60'hddf6c4375586579;
    stim[14] = 60'hba497e980a1d8ec;
    stim[15] = 60'ha733ad3fb52a087;
    stim[16] = 60'h9bae37e51e92bee;
    stim[17] = 60'h3739cddfdd2adfa;
    stim[18] = 60'h4a161ef1651545b;
    stim[19] = 60'h6339d23e5b5f46a;
    stim[20] = 60'h4c1c1d7e308210e;
    stim[21] = 60'hb5ddb2b85ea32bb;
    stim[22] = 60'h52043f93561ce4d;
    stim[23] = 60'h6d687f1d5ab8032;
    stim[24] = 60'hb4fc8b2f484ddc2;
    stim[25] = 60'h93cd9fd52f4c6fd;
    stim[26] = 60'hbd4fbebf85f761c;
    stim[27] = 60'h71cba7f97304ef7;
    stim[28] = 60'he8d08222ffce50a;
    stim[29] = 60'h7a500b83c8c40aa;
    stim[30] = 60'h6a7e09c7ba65c20;
    stim[31] = 60'h32ccd7442415f99;
    stim[32] = 60'h12f1d95c9de0800;
    stim[33] = 60'hac6c8e3cb45a10c;
    stim[34] = 60'h0bfd500330c32c2;
    stim[35] = 60'h1017e5872f8efdd;
    stim[36] = 60'hdf5580e3e60cef1;
    stim[37] = 60'hd00f1005c8a785e;
    stim[38] = 60'h6c0c48db29da06c;
    stim[39] = 60'hca7aa309b0a6b43;
    stim[40] = 60'h295bbe7acf32fc2;
    stim[41] = 60'he1ecf634825d777;
    stim[42] = 60'he98aa182bb1fb67;
    stim[43] = 60'h53febe5269d80c5;
    stim[44] = 60'hc40abe53605086c;
    stim[45] = 60'ha1b1a9c0811f72e;
    stim[46] = 60'ha754ddbdd595f36;
    stim[47] = 60'h2fde871e66f8f4d;
    stim[48] = 60'h3b4fcf9980ed852;
    stim[49] = 60'ha184c24944255b1;
    stim[50] = 60'h03d5ba3ab3fcb5b;
    stim[51] = 60'h62fb9bafc40cbf8;
    stim[52] = 60'h05fe1e1aaf56cd8;
    stim[53] = 60'ha19a9fc685a3053;
    stim[54] = 60'h9bc2648723ea496;
    stim[55] = 60'h5e036282513b263;
    stim[56] = 60'h6e79d0c2579bbcf;
    stim[57] = 60'h5dea21850d71a99;
    stim[58] = 60'h9d55ef53da6e53a;
    stim[59] = 60'h8e34315e47d94f3;
    stim[60] = 60'h065167222568b49;
    stim[61] = 60'h2da6283f5ff1972;
    stim[62] = 60'h356881efac4c67e;
    stim[63] = 60'h7e949933fa43c82;
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
      expv[0] = 68'h87bf3ada30924b4c9;
      expv[1] = 68'h99f12ea5da1b5afcf;
      expv[2] = 68'h534ae7aa6676db621;
      expv[3] = 68'hab8d82f3c7e10a78a;
      expv[4] = 68'h0239809b5d7ba00c6;
      expv[5] = 68'h571aaca4519270609;
      expv[6] = 68'h44fda78eeb373369e;
      expv[7] = 68'h5032cf633b3fd5304;
      expv[8] = 68'hd5a1a42cf47df81ae;
      expv[9] = 68'h327b49d05a3ae2580;
      expv[10] = 68'h9b64993d69f7c3cd8;
      expv[11] = 68'h6b018e4994073ab12;
      expv[12] = 68'hace8f52cebe0c0ad1;
      expv[13] = 68'hafddf6c4375586579;
      expv[14] = 68'hb5ba497e980a1d8ec;
      expv[15] = 68'h90a733ad3fb52a087;
      expv[16] = 68'hb49bae37e51e92bee;
      expv[17] = 68'ha73739cddfdd2adfa;
      expv[18] = 68'h3a4a161ef1651545b;
      expv[19] = 68'hb36339d23e5b5f46a;
      expv[20] = 68'h6a4c1c1d7e308210e;
      expv[21] = 68'he0b5ddb2b85ea32bb;
      expv[22] = 68'h8152043f93561ce4d;
      expv[23] = 68'hdd6d687f1d5ab8032;
      expv[24] = 68'h79b4fc8b2f484ddc2;
      expv[25] = 68'h5b93cd9fd52f4c6fd;
      expv[26] = 68'h32bd4fbebf85f761c;
      expv[27] = 68'h9c71cba7f97304ef7;
      expv[28] = 68'h8de8d08222ffce50a;
      expv[29] = 68'h137a500b83c8c40aa;
      expv[30] = 68'h676a7e09c7ba65c20;
      expv[31] = 68'h3f32ccd7442415f99;
      expv[32] = 68'h1512f1d95c9de0800;
      expv[33] = 68'hfdac6c8e3cb45a10c;
      expv[34] = 68'h7d0bfd500330c32c2;
      expv[35] = 68'h9d1017e5872f8efdd;
      expv[36] = 68'h90df5580e3e60cef1;
      expv[37] = 68'hb2d00f1005c8a785e;
      expv[38] = 68'h656c0c48db29da06c;
      expv[39] = 68'h88ca7aa309b0a6b43;
      expv[40] = 68'hb9295bbe7acf32fc2;
      expv[41] = 68'haae1ecf634825d777;
      expv[42] = 68'h72e98aa182bb1fb67;
      expv[43] = 68'h5c53febe5269d80c5;
      expv[44] = 68'h33c40abe53605086c;
      expv[45] = 68'hdca1b1a9c0811f72e;
      expv[46] = 68'h2fa754ddbdd595f36;
      expv[47] = 68'h282fde871e66f8f4d;
      expv[48] = 68'ha23b4fcf9980ed852;
      expv[49] = 68'hcfa184c24944255b1;
      expv[50] = 68'hfd03d5ba3ab3fcb5b;
      expv[51] = 68'h5a62fb9bafc40cbf8;
      expv[52] = 68'h3305fe1e1aaf56cd8;
      expv[53] = 68'he2a19a9fc685a3053;
      expv[54] = 68'hdd9bc2648723ea496;
      expv[55] = 68'hb05e036282513b263;
      expv[56] = 68'h9e6e79d0c2579bbcf;
      expv[57] = 68'h655dea21850d71a99;
      expv[58] = 68'hdd9d55ef53da6e53a;
      expv[59] = 68'h138e34315e47d94f3;
      expv[60] = 68'h3a065167222568b49;
      expv[61] = 68'hfd2da6283f5ff1972;
      expv[62] = 68'hb3356881efac4c67e;
      expv[63] = 68'hc57e949933fa43c82;
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
