// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09040 dut (
    .clk(clk),
    .resetn(in_vec[173:173]),
    .phase(in_vec[172:141]),
    .phase_valid(in_vec[140:140]),
    .data(in_vec[139:116]),
    .data_valid(in_vec[115:115]),
    .data_filtered(in_vec[114:83]),
    .data_filtered_valid(in_vec[82:82]),
    .i_q(in_vec[81:50]),
    .i_q_valid(in_vec[49:49]),
    .i_q_filtered(in_vec[48:17]),
    .i_q_filtered_valid(in_vec[16:16]),
    .dma_wr_overflow(in_vec[15:15]),
    .dma_wr_xfer_req(in_vec[14:14]),
    .channel_enable(in_vec[13:0]),
    .phase_ready(out_vec[40:40]),
    .data_ready(out_vec[39:39]),
    .data_filtered_ready(out_vec[38:38]),
    .i_q_ready(out_vec[37:37]),
    .i_q_filtered_ready(out_vec[36:36]),
    .overflow(out_vec[35:35]),
    .dma_wr_data(out_vec[34:3]),
    .dma_wr_en(out_vec[2:2]),
    .dma_wr_sync(out_vec[1:1]),
    .processing_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h0fa2b2d0b6bce5e4f2c2f39bfb0f2cfab069f1bcb4b8;
    stim[1] = 174'h0c1b52edb2f892f3d1e56da20ae4e9aa2ecabed168ab;
    stim[2] = 174'h312ac211e385dcb23b8c1f0a4c19357bfd4aa5c094d0;
    stim[3] = 174'h3b22187b4d7ad98b058baa3678c664d7cb4f224d0874;
    stim[4] = 174'h2d28651d7876b0b9bdbadd572aee3ebb8d0a90134381;
    stim[5] = 174'h2adb44eb4a3b7003da49cab5c4a99cd760d3e9969fae;
    stim[6] = 174'h26e2b36388c115a4a562a4b8e40c6babdbf6a371d959;
    stim[7] = 174'h3a14e8c42b83bd411f4e3e9246ca9c53dd4357d0701b;
    stim[8] = 174'h3f5109b9785537ebc90952c1f200c692805da3619b02;
    stim[9] = 174'h3d2c3ad2eec6d6403a48e2f3fbe08b67a19348104f88;
    stim[10] = 174'h2e749c71d72a0590146642ba6b481ff560556aa83f98;
    stim[11] = 174'h2eb7b14abb572f892a316d683eafe35de34c4424b5ca;
    stim[12] = 174'h26cbce64798ce0d0767e2363857b9cac7524f4a3b735;
    stim[13] = 174'h3fd276eaccd539d7087cc0c614a491e49c3b8ad1e845;
    stim[14] = 174'h3bd6381331562d9dbb6c9aa3639b08dd0ddcc8fbc85c;
    stim[15] = 174'h36e32417fa35f406a4b609fe9f7679b2dd5b9c90d981;
    stim[16] = 174'h356af4cf5cb359446fad500ac12ace42986c32ec04c3;
    stim[17] = 174'h29c77b4e17e66559ef03e0e3172c8c4cd9b71bb0ff22;
    stim[18] = 174'h298417dd8019ad7a93656d52883097194a329b588d37;
    stim[19] = 174'h3d24578efada6f86bd2cf385c8efe43fff0e0f30a06a;
    stim[20] = 174'h298ad3f5b54e3721238cee36740e913e68e6e63a4547;
    stim[21] = 174'h3b0cbe78203a6f66c398a45d5fb884bb9c1bb087e7f3;
    stim[22] = 174'h200d5f065b75cc68cc0bebb8fcfc13d359d3cb7829e0;
    stim[23] = 174'h2c21d8be5c9e7cabb4e67afeabb9c1d071be5398ea5f;
    stim[24] = 174'h2b77a2b91622cfcfeaa2530baebae3992d7f29ba52d3;
    stim[25] = 174'h35fabf8246fc52b8e4790480dfdf3bec94e1a1996511;
    stim[26] = 174'h325092890853ebe2f913577e0803bb4188e853742e60;
    stim[27] = 174'h39328d6979262327d29386babc8db029bd14e5ae1d89;
    stim[28] = 174'h30943301231cd9d304242ccba5e2b19550eb561c8c9a;
    stim[29] = 174'h23122993562cd95c29e0ae73cb584e5617f5e9e7ca04;
    stim[30] = 174'h28bd2d0a1c47c6c283081fb78d415def8ea723f08f9d;
    stim[31] = 174'h37bd8b07cdfcbc4e2811900ede4356778a9f88fc5e5a;
    stim[32] = 174'h2fd4accc2dff56e13cfc6296768a07e1357413e3e112;
    stim[33] = 174'h2fa6d688cc927ce9293d611eeb841b3c55fe6a9389d2;
    stim[34] = 174'h3b5aa8020b782e3c6af669c0586869219bbbe5b1aee0;
    stim[35] = 174'h2dc1186b3d81e995af45acbb42bfdbc303b4a5891b3f;
    stim[36] = 174'h2bd0161dd414d0347e49481aae5370a30a39a5df4818;
    stim[37] = 174'h396029576289c46b50e463080485fa5b3be1b35d46d3;
    stim[38] = 174'h213cef8582fc6f84d00759f705a0592c1eff44c6dd6f;
    stim[39] = 174'h3dbf9aa3882601fb60bdeb82d5e6e70f2664123c7071;
    stim[40] = 174'h37ec40905fedcc2106b5ac8e9255f432ee994344a63d;
    stim[41] = 174'h2a8bbc4f11738d49270f874bb6e2bace56fdc10ab91a;
    stim[42] = 174'h3887bb2d754a84db95cafecf237a52103a4f4d5fdad6;
    stim[43] = 174'h388112a956f0ba805fbeda887c5610fa524f633effab;
    stim[44] = 174'h27db09c030f5501ff16ae95794dc161c9309ee8e3b34;
    stim[45] = 174'h266291bb4b00c4bdeadcdedd10b8195945040fb7c8df;
    stim[46] = 174'h348e4f79547a5dccfd29334656d09678b6899dbcb664;
    stim[47] = 174'h242e06ec35bc2217fdcb828c581033e33c58bc6fb05e;
    stim[48] = 174'h3e103657be322ec26a64b36080b49ea8905506f2b0e7;
    stim[49] = 174'h3599d8a2bea6b0e187dac7b7503897324d930582075c;
    stim[50] = 174'h2c676101cc16e3acbaa1e08bab8f6b41e09832ded0df;
    stim[51] = 174'h212dd3d924217a865ce38cedfd8b0332444bf06e0183;
    stim[52] = 174'h2a4bd5fa23d60704619dae786200f81fb7279e4f3d9c;
    stim[53] = 174'h23397f4337b4b9bef140fdb7367e6fdaf0fffe3bdaa8;
    stim[54] = 174'h2bb4f28200aea6e533dbd8f24a6f5f712fcc933b14e4;
    stim[55] = 174'h2bfc1df8643533519487f4e1c1adb61916ee6acf9c93;
    stim[56] = 174'h23776d9ca53a704c240e7ca27d4ce757b044b2536c16;
    stim[57] = 174'h2af8a1f1b2d12ac4bf928b85b948b873b56cbf1288ac;
    stim[58] = 174'h2bb030a45460ed60cf48b57dd1396bf7a58e5c6bbbe1;
    stim[59] = 174'h376bd6ad9d1cbd4a398a64af41b53eb168787c6e8cb8;
    stim[60] = 174'h28719efe3ca3eefd2d7c49d5d151f2e497bb7c792d0b;
    stim[61] = 174'h3b03e9200a7143617ec3164d3841a772113d7b83d6d2;
    stim[62] = 174'h360f6844b6b017b11cd59e81533866b980655f324b27;
    stim[63] = 174'h39535a0e580e1ca70343f4100465e273dd44c03a5cdb;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'hxx3e8acb42b;
      expv[2] = 41'h08b06d4bb6e;
      expv[3] = 41'h10001c2ee58;
      expv[4] = 41'h106c8861ed3;
      expv[5] = 41'h08b4a19475e;
      expv[6] = 41'h108051db801;
      expv[7] = 41'h101b8acd8e3;
      expv[8] = 41'h10e853a310a;
      expv[9] = 41'h107d4426e5b;
      expv[10] = 41'h1074b0eb4ba;
      expv[11] = 41'h10b9d271c72;
      expv[12] = 41'h10badec52aa;
      expv[13] = 41'h109b2f3991b;
      expv[14] = 41'h10ff49dbab3;
      expv[15] = 41'h08ef58e04cb;
      expv[16] = 41'h080051afa02;
      expv[17] = 41'h1080659aca3;
      expv[18] = 41'h08a71ded382;
      expv[19] = 41'h108000cd6ba;
      expv[20] = 41'h1074915e3bb;
      expv[21] = 41'h08a62b4fd6f;
      expv[22] = 41'h080001d37b0;
      expv[23] = 41'h10805bae631;
      expv[24] = 41'h08308762f97;
      expv[25] = 41'h040031167e5;
      expv[26] = 41'h040e4790480;
      expv[27] = 41'h102f9135778;
      expv[28] = 41'h10e4ca35a5a;
      expv[29] = 41'h10c250cc04b;
      expv[30] = 41'h088c48a64d2;
      expv[31] = 41'h1000623e363;
      expv[32] = 41'h10def62c1f3;
      expv[33] = 41'h10bf52b330a;
      expv[34] = 41'h10be9b5a232;
      expv[35] = 41'h106d6aa0082;
      expv[36] = 41'h10370461acb;
      expv[37] = 41'h082f4058773;
      expv[38] = 41'h0480144e237;
      expv[39] = 41'h024d00759f5;
      expv[40] = 41'h02dabcdce18;
      expv[41] = 41'h10d24abe860;
      expv[42] = 41'h10aa2ef13c3;
      expv[43] = 41'h08e21eecb5b;
      expv[44] = 41'h08003785d42;
      expv[45] = 41'h108007aa80b;
      expv[46] = 41'h10998a46ed2;
      expv[47] = 41'h10d2393de52;
      expv[48] = 41'h1090b81bb0a;
      expv[49] = 41'h107840d95ea;
      expv[50] = 41'h10d667628ab;
      expv[51] = 41'h10319d84072;
      expv[52] = 41'h1004b74f64a;
      expv[53] = 41'h10a92f57e8b;
      expv[54] = 41'h080ce5fd0ca;
      expv[55] = 41'h10800575372;
      expv[56] = 41'h102ff077e1b;
      expv[57] = 41'h108dddb672a;
      expv[58] = 41'h10abe287c6a;
      expv[59] = 41'h10aec0c2912;
      expv[60] = 41'h105daf5ab62;
      expv[61] = 41'h10a1c67bf8b;
      expv[62] = 41'h106c0fa4803;
      expv[63] = 41'h08583da112f;
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
