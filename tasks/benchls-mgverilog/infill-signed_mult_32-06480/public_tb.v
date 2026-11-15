// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06480 dut (
    .clk(clk),
    .ce(in_vec[64:64]),
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
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
    stim[0] = 65'h07c581c698f9546e8;
    stim[1] = 65'h1693ecb18a378a8da;
    stim[2] = 65'h11dcc04e7b3945149;
    stim[3] = 65'h0369ee90a350d9cdd;
    stim[4] = 65'h03f96c5929a29a275;
    stim[5] = 65'h0606bebafba80c320;
    stim[6] = 65'h1eb1bdeb6c94adb57;
    stim[7] = 65'h0261148d309d1796d;
    stim[8] = 65'h06c49e070aab6a493;
    stim[9] = 65'h14335551b68975bb3;
    stim[10] = 65'h1421c9bb6ddc043c5;
    stim[11] = 65'h16b51861bf36c6d22;
    stim[12] = 65'h108b9de0281023c4e;
    stim[13] = 65'h19174a52f2121950a;
    stim[14] = 65'h13f44ff65c0b53524;
    stim[15] = 65'h06f03097f605bbb28;
    stim[16] = 65'h0c8f70909d1a87dd8;
    stim[17] = 65'h0ed8ba43804f515cb;
    stim[18] = 65'h14148d2ef25761874;
    stim[19] = 65'h1fad058104513ea37;
    stim[20] = 65'h057d7df2e610a2320;
    stim[21] = 65'h1d33e1afa4b384659;
    stim[22] = 65'h151a3b9033a0418fe;
    stim[23] = 65'h183a276ff7f0808e6;
    stim[24] = 65'h0077ec116ff751f95;
    stim[25] = 65'h0264e55b7249ce4fa;
    stim[26] = 65'h078c7d77ba227f58b;
    stim[27] = 65'h04e7ebd98f5e0cb5c;
    stim[28] = 65'h012208dbf7e522f1e;
    stim[29] = 65'h0624503b2b13aa17b;
    stim[30] = 65'h0a4ce9c803d85fea1;
    stim[31] = 65'h1f73b394d62831edd;
    stim[32] = 65'h0329b0b304ad5c1d4;
    stim[33] = 65'h0c5497679df4ceb7f;
    stim[34] = 65'h1a54bb796e654aacf;
    stim[35] = 65'h1e7823f539b4d85c6;
    stim[36] = 65'h0ebbc798b3679dc9a;
    stim[37] = 65'h1c5dbfd21148d80a0;
    stim[38] = 65'h1c5ed5591d05c824a;
    stim[39] = 65'h07f7568dc0a70fa2a;
    stim[40] = 65'h0a756350137f810d8;
    stim[41] = 65'h1a16a5d28d0177717;
    stim[42] = 65'h1c6db97bab87e386a;
    stim[43] = 65'h143dce007cb5ce7d4;
    stim[44] = 65'h1c3690ed49e9d51e4;
    stim[45] = 65'h1fff7c160ba52c89c;
    stim[46] = 65'h035e2295a28ccf62d;
    stim[47] = 65'h14d4fb29acb5bdf3f;
    stim[48] = 65'h1c8828869bbf1eb47;
    stim[49] = 65'h07f9a93c8e95ff306;
    stim[50] = 65'h0a7e1dc3a4398b82b;
    stim[51] = 65'h05391914671b1398d;
    stim[52] = 65'h16da5061461bbfd9c;
    stim[53] = 65'h19440b7b5f35d2585;
    stim[54] = 65'h1f46d0cbc48fd6420;
    stim[55] = 65'h17f20c43406396597;
    stim[56] = 65'h06f58c0dc2f3098fe;
    stim[57] = 65'h0646b79b51025af73;
    stim[58] = 65'h1136ade96335134da;
    stim[59] = 65'h0698e2a17b7a00b52;
    stim[60] = 65'h1c15e08a6bbddd42d;
    stim[61] = 65'h0c8d6f2ecef4b2e6a;
    stim[62] = 65'h1f11ebcf31900d30a;
    stim[63] = 65'h151969fcbff4643af;
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
      expv[2] = 32'h5000b270;
      expv[3] = 32'h67467cdf;
      expv[4] = 32'h67467cdf;
      expv[5] = 32'h67467cdf;
      expv[6] = 32'h67467cdf;
      expv[7] = 32'h049a61da;
      expv[8] = 32'h049a61da;
      expv[9] = 32'h049a61da;
      expv[10] = 32'h1e781ae1;
      expv[11] = 32'h4344750e;
      expv[12] = 32'h2b514e96;
      expv[13] = 32'hf6ae1c9c;
      expv[14] = 32'hecc1ced6;
      expv[15] = 32'h80fcd334;
      expv[16] = 32'h80fcd334;
      expv[17] = 32'h80fcd334;
      expv[18] = 32'h80fcd334;
      expv[19] = 32'h2deffc4c;
      expv[20] = 32'h2c718b70;
      expv[21] = 32'h2c718b70;
      expv[22] = 32'h90a7bcea;
      expv[23] = 32'hebd5d8fa;
      expv[24] = 32'h90a6e11a;
      expv[25] = 32'h90a6e11a;
      expv[26] = 32'h90a6e11a;
      expv[27] = 32'h90a6e11a;
      expv[28] = 32'h90a6e11a;
      expv[29] = 32'h90a6e11a;
      expv[30] = 32'h90a6e11a;
      expv[31] = 32'h90a6e11a;
      expv[32] = 32'h2b3e7d79;
      expv[33] = 32'h2b3e7d79;
      expv[34] = 32'h2b3e7d79;
      expv[35] = 32'hf15b0e4a;
      expv[36] = 32'h069a1932;
      expv[37] = 32'h069a1932;
      expv[38] = 32'ha73bb4a0;
      expv[39] = 32'h4c2a5dea;
      expv[40] = 32'h4c2a5dea;
      expv[41] = 32'h4c2a5dea;
      expv[42] = 32'hd073f698;
      expv[43] = 32'hbda98304;
      expv[44] = 32'h9093d6cc;
      expv[45] = 32'h374648d0;
      expv[46] = 32'h3accd680;
      expv[47] = 32'h3accd680;
      expv[48] = 32'h0def19e6;
      expv[49] = 32'h8d45381f;
      expv[50] = 32'h8d45381f;
      expv[51] = 32'h8d45381f;
      expv[52] = 32'h8d45381f;
      expv[53] = 32'hec2d7830;
      expv[54] = 32'hebed9a09;
      expv[55] = 32'h9c670780;
      expv[56] = 32'hd1503eac;
      expv[57] = 32'hd1503eac;
      expv[58] = 32'hd1503eac;
      expv[59] = 32'h8dae03bc;
      expv[60] = 32'h8dae03bc;
      expv[61] = 32'h95fefd2e;
      expv[62] = 32'h95fefd2e;
      expv[63] = 32'h7befaa7e;
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
