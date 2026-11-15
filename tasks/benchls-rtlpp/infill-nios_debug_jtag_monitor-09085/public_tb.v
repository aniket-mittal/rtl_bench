// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09085 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h18b3ade664e661768f003cc7f43a8ce;
    stim[1] = 122'h37df1c1ee2591cd4749af2dba4bcfc7;
    stim[2] = 122'h16631d048ba82b918f4092979d5dbe8;
    stim[3] = 122'h3f52f18d8ca0394e406d773de28c4c6;
    stim[4] = 122'h2dea2c2157ce82dcfdc3b85f515ade0;
    stim[5] = 122'h3050b23654b72f8defc9b0502369cec;
    stim[6] = 122'h187a05e3e48f8acac74534232dac75f;
    stim[7] = 122'h2d401194a94467668b4a2b410abc526;
    stim[8] = 122'h24786f3243530676c141ee4c6ee7135;
    stim[9] = 122'h1d13272baca80ae58250443f23e0f6d;
    stim[10] = 122'h21f40e8df50a461132653c554aff661;
    stim[11] = 122'h1bbeebe284cd0ea2bcccaec34e9cb01;
    stim[12] = 122'h1213e17204d0f52d31404878e7cb275;
    stim[13] = 122'h0a3cd6abcb6daf184dd9b1d55ed247d;
    stim[14] = 122'h3b723aedff7af0add35bb5deb6b5fbb;
    stim[15] = 122'h344227fcd37a734bd054d1124795a3b;
    stim[16] = 122'h2317dc4721c4e7ff8337000198cd041;
    stim[17] = 122'h151dc6253caef0ab98e580509297f1a;
    stim[18] = 122'h0656e38faa3c57c85bf12b5167802ab;
    stim[19] = 122'h213438bf50f28bc190d79b5d633af83;
    stim[20] = 122'h0dc13db70f3f05a682ed3c7faef9bc9;
    stim[21] = 122'h251857c1aacca337a0d70e18b12b7b3;
    stim[22] = 122'h104deb256752774a40c181c39c815f1;
    stim[23] = 122'h28fb13751e146afd9c735988227406d;
    stim[24] = 122'h36f140e968840501f5523d5d01491b5;
    stim[25] = 122'h305796774ce9faadeb648e67ad006c5;
    stim[26] = 122'h1bb4791af5ca221805c4fc4f8373b34;
    stim[27] = 122'h2dbf9fff5ab552e211586223ec8a96b;
    stim[28] = 122'h17d48dc634ae00e339ed6032c556f35;
    stim[29] = 122'h1e1b24d75a2a04f3697a35832486016;
    stim[30] = 122'h35777bfc32bbeb7e96d159c3fa42b67;
    stim[31] = 122'h09fdd17d141ed029e86af20c55ea2be;
    stim[32] = 122'h1f2b094365a3a60deb6c99d09635cd1;
    stim[33] = 122'h00859d1fbc8aca587efbd78c87e408e;
    stim[34] = 122'h0db48b8772fe87f5656ddc1ea98e227;
    stim[35] = 122'h38355d524219c9463b5650e9fd0676e;
    stim[36] = 122'h31cbe2c93a9fe261f94e4f8eee18242;
    stim[37] = 122'h041bd366c89d95d43759f57a6480336;
    stim[38] = 122'h246775207d521abd46671bcbb4a4485;
    stim[39] = 122'h299767b98badd42c6b4cb7c5bd32317;
    stim[40] = 122'h364a5200891632ee68ed582ec12851c;
    stim[41] = 122'h23d44be6e48a9b1a416b8699ed9d0e5;
    stim[42] = 122'h0e79bfb99bc39c67a860dacda10992a;
    stim[43] = 122'h308251b37ef48ac1e7c242544e664d6;
    stim[44] = 122'h0a5631be2dc73cd79fe30ee3e0a955e;
    stim[45] = 122'h37597bc3830d1446585eb95a3d7d85e;
    stim[46] = 122'h371d0576847691c9347fc2cc213a8c5;
    stim[47] = 122'h0276db35f749cd398ffb5928c9cd6d9;
    stim[48] = 122'h3f3329c4033661943de64c0ad122d7a;
    stim[49] = 122'h3d206f65d75c02a8126bda795d38541;
    stim[50] = 122'h378502ce6fd54b92366a7ac466f1939;
    stim[51] = 122'h129ff2885be0a6c79a46e32f970998a;
    stim[52] = 122'h3aef9e932f21f0b6c66fb759eb02197;
    stim[53] = 122'h23227cbc1169be6ce75fbf68ba36930;
    stim[54] = 122'h1c1439841793c0c8fccfaf41cb13136;
    stim[55] = 122'h0973f4f3d5e7ac55e3ff7f3e3d5a5ed;
    stim[56] = 122'h1474b40b553d2ca4d0c21e8ed5d641d;
    stim[57] = 122'h3ce5bc9e7da95c14acf3484fa44d104;
    stim[58] = 122'h326239f708a40c51534cb6ed21c272e;
    stim[59] = 122'h2555e42a81f7c34aed65eed288ba78e;
    stim[60] = 122'h31dae5305b2f61be40406d7aafc1522;
    stim[61] = 122'h3d3c325267cadf687b76e74ad1f6ec6;
    stim[62] = 122'h2c97f650f4e3e05044712021e626691;
    stim[63] = 122'h0f7e34ffcf3cca1bbc5262beedd7938;
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
      expv[0] = 53'h0xxxxxxxxxxxxx;
      expv[1] = 53'h0xxxxxxxxxxxxx;
      expv[2] = 53'h0xxxxxxxxxxxxx;
      expv[3] = 53'h0xxxxxxxxxxxxx;
      expv[4] = 53'h0xxxxxxxxxxxxx;
      expv[5] = 53'h0xxxxxxxxxxxxx;
      expv[6] = 53'h0xxxxxxxxxxxxx;
      expv[7] = 53'h0xxxxxxxxxxxxx;
      expv[8] = 53'h0xxxxxxxxxxxxx;
      expv[9] = 53'h0xxxxxxxxxxxxx;
      expv[10] = 53'h0xxxxxxxxxxxxx;
      expv[11] = 53'h0xxxxxxxxxxxxx;
      expv[12] = 53'h0xxxxxxxxxxxxx;
      expv[13] = 53'h0xxxxxxxxxxxxx;
      expv[14] = 53'h0xxxxxxxxxxxxx;
      expv[15] = 53'h0xxxxxxxxxxxxx;
      expv[16] = 53'h0xxxxxxxxxxxxx;
      expv[17] = 53'h0xxxxxxxxxxxxx;
      expv[18] = 53'h0xxxxxxxxxxxxx;
      expv[19] = 53'h0xxxxxxxxxxxxx;
      expv[20] = 53'h0xxxxxxxxxxxxx;
      expv[21] = 53'h0xxxxxxxxxxxxx;
      expv[22] = 53'h0xxxxxxxxxxxxx;
      expv[23] = 53'h0xxxxxxxxxxxxx;
      expv[24] = 53'h0xxxxxxxxxxxxx;
      expv[25] = 53'h0xxxxxxxxxxxxx;
      expv[26] = 53'h0xxxxxxxxxxxxx;
      expv[27] = 53'h0xxxxxxxxxxxxx;
      expv[28] = 53'h0xxxxxxxxxxxxx;
      expv[29] = 53'h0xxxxxxxxxxxxx;
      expv[30] = 53'h0xxxxxxxxxxxxx;
      expv[31] = 53'h0xxxxxxxxxxxxx;
      expv[32] = 53'h0xxxxxxxxxxxxx;
      expv[33] = 53'h0xxxxxxxxxxxxx;
      expv[34] = 53'h0xxxxxxxxxxxxx;
      expv[35] = 53'h0xxxxxxxxxxxxx;
      expv[36] = 53'h0xxxxxxxxxxxxx;
      expv[37] = 53'h0xxxxxxxxxxxxx;
      expv[38] = 53'h0xxxxxxxxxxxxx;
      expv[39] = 53'h0xxxxxxxxxxxxx;
      expv[40] = 53'h0xxxxxxxxxxxxx;
      expv[41] = 53'h0xxxxxxxxxxxxx;
      expv[42] = 53'h0xxxxxxxxxxxxx;
      expv[43] = 53'h0xxxxxxxxxxxxx;
      expv[44] = 53'h0xxxxxxxxxxxxx;
      expv[45] = 53'h0xxxxxxxxxxxxx;
      expv[46] = 53'h0xxxxxxxxxxxxx;
      expv[47] = 53'h0xxxxxxxxxxxxx;
      expv[48] = 53'h0xxxxxxxxxxxxx;
      expv[49] = 53'h0xxxxxxxxxxxxx;
      expv[50] = 53'h0xxxxxxxxxxxxx;
      expv[51] = 53'h0xxxxxxxxxxxxx;
      expv[52] = 53'h0xxxxxxxxxxxxx;
      expv[53] = 53'h0xxxxxxxxxxxxx;
      expv[54] = 53'h0xxxxxxxxxxxxx;
      expv[55] = 53'h0xxxxxxxxxxxxx;
      expv[56] = 53'h0xxxxxxxxxxxxx;
      expv[57] = 53'h0xxxxxxxxxxxxx;
      expv[58] = 53'h0xxxxxxxxxxxxx;
      expv[59] = 53'h0xxxxxxxxxxxxx;
      expv[60] = 53'h0xxxxxxxxxxxxx;
      expv[61] = 53'h0xxxxxxxxxxxxx;
      expv[62] = 53'h0xxxxxxxxxxxxx;
      expv[63] = 53'h0xxxxxxxxxxxxx;
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
