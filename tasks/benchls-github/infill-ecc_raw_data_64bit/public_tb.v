// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ecc_raw_data_64bit dut (
    .clk(clk),
    .rst(in_vec[72:72]),
    .c(in_vec[71:0]),
    .d(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h13d005b1f4b48c51e64;
    stim[1] = 73'h166dd1196653e0e806d;
    stim[2] = 73'h0c74517f9a23af45e40;
    stim[3] = 73'h007ce2bde051f3b861f;
    stim[4] = 73'h0f508b2838882fa4cb0;
    stim[5] = 73'h024d4a3dd9217f60197;
    stim[6] = 73'h03d27f493386c07ffe1;
    stim[7] = 73'h0af956facda74ac1993;
    stim[8] = 73'h05fa8e502e32fefe9ea;
    stim[9] = 73'h02b6d89e82346a93ecb;
    stim[10] = 73'h1035d69c389d571ef6a;
    stim[11] = 73'h083c4669df5a2940754;
    stim[12] = 73'h05ad890df0d6c897246;
    stim[13] = 73'h08d69286c09995cb14d;
    stim[14] = 73'h0d1584f7ed34130523f;
    stim[15] = 73'h061c3394eb412f842c4;
    stim[16] = 73'h0810f06ae09e5a026b7;
    stim[17] = 73'h0476e07da22b4f4a6c4;
    stim[18] = 73'h05ac1ac3394b8d059f0;
    stim[19] = 73'h0e03cd75f6d593927fd;
    stim[20] = 73'h09892ad4d63ed1be16d;
    stim[21] = 73'h060fc900afb55ada3c6;
    stim[22] = 73'h080c71346909abdcf5b;
    stim[23] = 73'h0f14247d9cb32310320;
    stim[24] = 73'h0e792cfeb1e544e8a04;
    stim[25] = 73'h070f8140415409d241b;
    stim[26] = 73'h02937662835ed2e7460;
    stim[27] = 73'h0ec3d2d0e263b601e7e;
    stim[28] = 73'h02616b7a89e8238aebe;
    stim[29] = 73'h01435a48ce8614c8615;
    stim[30] = 73'h0dc1836a112c30d0f52;
    stim[31] = 73'h09d32622941100f25ae;
    stim[32] = 73'h0cca4b041e8eb4d6ec9;
    stim[33] = 73'h0d887f38373d6406a40;
    stim[34] = 73'h0db368a59b20cd57c14;
    stim[35] = 73'h0a9786b2d8439cfd6e6;
    stim[36] = 73'h07ab97efcf45a00410f;
    stim[37] = 73'h0dbe56f51122eb2c854;
    stim[38] = 73'h05f504bc3c6d6d23983;
    stim[39] = 73'h04bd3e20cb5d88cf529;
    stim[40] = 73'h025b44f3147005d0e88;
    stim[41] = 73'h03dcc080e2d99db9903;
    stim[42] = 73'h02ee49ce13ad33ffecb;
    stim[43] = 73'h0957f95fd05cd54d920;
    stim[44] = 73'h084e49cfb6b4668c3e0;
    stim[45] = 73'h0d9419df2aac2a3e313;
    stim[46] = 73'h0ade4e020922fefecd2;
    stim[47] = 73'h07bb8dac4acac58f0ea;
    stim[48] = 73'h0decbef2a41387898b0;
    stim[49] = 73'h0e728bea71f87bb5447;
    stim[50] = 73'h0f19b24d31ee17faaea;
    stim[51] = 73'h0a208e345214da8f54b;
    stim[52] = 73'h0bbbd911b1c3169310f;
    stim[53] = 73'h06dd088f027e18b8948;
    stim[54] = 73'h05ed54917624f458df0;
    stim[55] = 73'h05b59d8beae25656ec0;
    stim[56] = 73'h067b82e263402e195b8;
    stim[57] = 73'h02c91e37a1e6029edf5;
    stim[58] = 73'h0317bcd1426c1eee891;
    stim[59] = 73'h0a943907c324a8150a3;
    stim[60] = 73'h0b527152b1b7c5a65df;
    stim[61] = 73'h08ae456bddfa7fbb26c;
    stim[62] = 73'h05756f2eaa24257424c;
    stim[63] = 73'h0ad36bd66bea8857fdc;
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
      expv[0] = 64'h7a016c7d2e4629ed;
      expv[1] = 64'hcd74465995f0700d;
      expv[2] = 64'h8f145fe689d7a5e8;
      expv[3] = 64'h0f38af7814f9d863;
      expv[4] = 64'hea22ca0e2017d4c6;
      expv[5] = 64'h49528f7648bfb013;
      expv[6] = 64'h7a9fd24ce3603ffc;
      expv[7] = 64'h5e55beb36ba56192;
      expv[8] = 64'hbea3940b8d7f7e9c;
      expv[9] = 64'h57b627a08e354be8;
      expv[10] = 64'h0775a70e26ab8efc;
      expv[11] = 64'h07119a77d514a07b;
      expv[12] = 64'hb562437c37644f29;
      expv[13] = 64'h1ba4a1b024cae319;
      expv[14] = 64'ha3613dfb4e098527;
      expv[15] = 64'hc30ce53ad097c429;
      expv[16] = 64'h023c1ab8272d0267;
      expv[17] = 64'h8fb81f6889a7a269;
      expv[18] = 64'hb506b0ce51c6859e;
      expv[19] = 64'hc0f35d7db6c9ca7f;
      expv[20] = 64'h304ab5358f68de1d;
      expv[21] = 64'hc1f2402beead6a39;
      expv[22] = 64'h011c4d1a40d5ecfa;
      expv[23] = 64'he3091f672d918834;
      expv[24] = 64'hce4b3fac7aa270a1;
      expv[25] = 64'he1e050105604ea42;
      expv[26] = 64'h52dd98a0d769774c;
      expv[27] = 64'hd8f4b43899db01ef;
      expv[28] = 64'h4c5adea27811c2e7;
      expv[29] = 64'h28d69233a30a6063;
      expv[30] = 64'hb860da844a1868fa;
      expv[31] = 64'h3ac988a504807a55;
      expv[32] = 64'h9892c107a35a6ee8;
      expv[33] = 64'hb01fce0dceb206a8;
      expv[34] = 64'hb6da2966c866afc3;
      expv[35] = 64'h53e1acb611ce7d6d;
      expv[36] = 64'hf4e5fbf3d2d00411;
      expv[37] = 64'hb795bd444975948b;
      expv[38] = 64'hbf412f0f1ab69390;
      expv[39] = 64'h974f8832d6c46754;
      expv[40] = 64'h4ad13cc51c02e8e0;
      expv[41] = 64'h7b302038b4ced990;
      expv[42] = 64'h5d927384ea99ffe8;
      expv[43] = 64'h2bfe57f4166aa594;
      expv[44] = 64'h099273edae33443c;
      expv[45] = 64'hb30677caaa151e32;
      expv[46] = 64'h5b938082497f7eca;
      expv[47] = 64'hf6e36b12b162c70c;
      expv[48] = 64'hbd2fbca905c3c186;
      expv[49] = 64'hcea2fa9c7c3ddd49;
      expv[50] = 64'he26c934c7b0bfaac;
      expv[51] = 64'h44238d14866d4758;
      expv[52] = 64'h76f6446c718b4b11;
      expv[53] = 64'hdb4223c09f0c5898;
      expv[54] = 64'hbd55245d8a7a28de;
      expv[55] = 64'hb76762fab92b2ee8;
      expv[56] = 64'hcee0b898d0170956;
      expv[57] = 64'h58478de87b014edf;
      expv[58] = 64'h63ef34509a0f7682;
      expv[59] = 64'h530e41f0ca540d04;
      expv[60] = 64'h6a9c54ac6fe2d65b;
      expv[61] = 64'h15915af77d3fdb2d;
      expv[62] = 64'haf5bcbaa8a12bc29;
      expv[63] = 64'h5adaf59af9442ffb;
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
