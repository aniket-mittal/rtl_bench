// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022961 dut (
    .clk_6M(clk),
    .rstz(in_vec[136:136]),
    .p_1us(in_vec[135:135]),
    .correWindow(in_vec[134:134]),
    .sync_in(in_vec[133:70]),
    .ref_sync(in_vec[69:6]),
    .regi_correthreshold(in_vec[5:0]),
    .ps_corre_threshold(out_vec[6:6]),
    .corre_tslotdly_endp(out_vec[5:5]),
    .corre_halftslotdly_endp(out_vec[4:4]),
    .corr_2tslotdly_endp(out_vec[3:3]),
    .corr_3tslotdly_endp(out_vec[2:2]),
    .corr_4tslotdly_endp(out_vec[1:1]),
    .pscorr_trgp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h151e2ba094145e2ed83c64d65c48c6050d7;
    stim[1] = 137'h18f105507dc713077fc7791f81b063b5353;
    stim[2] = 137'h07368e59d9154027cc6ff8c8747b65e6cf3;
    stim[3] = 137'h03f6af6e4fabb609911c67613c4577ab6e2;
    stim[4] = 137'h07756a57d492abcf2471186df0c433a48a2;
    stim[5] = 137'h0a6a2e7d50486ef1fc6f8925a168257fe2c;
    stim[6] = 137'h0a0b859fe09fbc351ea2eeb88e7cdee0e0d;
    stim[7] = 137'h0c9bf6edc99197d253d1b3c0bf801a976f8;
    stim[8] = 137'h0a2b0dada3e7abc825ca98fbf63d7f1afb6;
    stim[9] = 137'h0e69ed5feb4f6d85a41d802222fa1936f73;
    stim[10] = 137'h0033887569e52cfd210bac49b638e1955dd;
    stim[11] = 137'h0323502e4238f6773ec0123aea5c3b82c60;
    stim[12] = 137'h0eaf69531757b2794f299a81f8cb4f76df7;
    stim[13] = 137'h025cbdbffffb32f304f36cf8f6e1d9e4ef3;
    stim[14] = 137'h070a03a2f75109aadf087a26ac8a256e86f;
    stim[15] = 137'h0cefd3fd08341380b3399153d00c600d041;
    stim[16] = 137'h09ae74d429b1f4ad46fd5ea3ffeb2741c48;
    stim[17] = 137'h03906cd0faae0cc997ce29e60dfb51c6c12;
    stim[18] = 137'h09634d819dc815705c1959b1417db8f0538;
    stim[19] = 137'h1bf3602ec52e8fbbe3b47e9f438bddfb097;
    stim[20] = 137'h0268621b56d9d4ab71b4de7bcaa79b3ddd6;
    stim[21] = 137'h02335f9807dbfdded1cff9e735ae079c72f;
    stim[22] = 137'h0b905bcc3bbc7afa0fcbe8382363d27d9ff;
    stim[23] = 137'h0b6c6215664aa5ce55b1f700c6febf2411f;
    stim[24] = 137'h0db14ebd4f4bb05e328234fff58ee55ff7e;
    stim[25] = 137'h066ad5fd0edc21d024c9976463e54f223de;
    stim[26] = 137'h02561645116b690ce631bb22ec266a3317a;
    stim[27] = 137'h054e654b4baeff7279fe66ffaee21ffa267;
    stim[28] = 137'h00bad9f04ba537ac62b94991941458aff80;
    stim[29] = 137'h07a00bc884bcfadecb6722b31e439320480;
    stim[30] = 137'h021c62ca474bdd7290744e7edfcd9ab5bfd;
    stim[31] = 137'h020164a49f462c993af84ecff742fbf60c5;
    stim[32] = 137'h0d5133cfb6245d62306d747fa58885a858e;
    stim[33] = 137'h0f8be6bca3f0bc534f264e8160fb597d546;
    stim[34] = 137'h16cc8624e6ea4115809ca68de109cad29ba;
    stim[35] = 137'h013638e9b6f62e6b1657e4565ccae8ea4db;
    stim[36] = 137'h0f780814b0418c8b5181baaeb811cc8b242;
    stim[37] = 137'h0de4bde2626fa74dd6135f724d609a5d033;
    stim[38] = 137'h0eee5a1f3c2b2f7d37162a4a3b9ad44be75;
    stim[39] = 137'h055d5f43d3fbea24e3d4a9fdece11522686;
    stim[40] = 137'h0b899e68659d00c0bd4cada63573a372860;
    stim[41] = 137'h0a04e68b9a9c140433bb4dd075829c29d78;
    stim[42] = 137'h0564e51284b513d36e65f26941afa952468;
    stim[43] = 137'h08ae51fb3d977b3000889861c54a0c89cc2;
    stim[44] = 137'h05bd4f58efd627f8a01c351d80802b4f041;
    stim[45] = 137'h0ce409e3cd1528e5491f5b0aa19b5b2ca3c;
    stim[46] = 137'h01d9ed77aa9dc23f935ccfb152a68a95bff;
    stim[47] = 137'h0e5d3f9b8c5b45e79abff567ca217aca1e2;
    stim[48] = 137'h0e4a0c9b38b9b582bac4b3b683c7957d4c8;
    stim[49] = 137'h0910a254051a6c5e1d49d686f33bdfdad0e;
    stim[50] = 137'h038d1b294cfaf26ffb16049477f5656b831;
    stim[51] = 137'h0eebe900a93f6a0c26feb26965858b0e41d;
    stim[52] = 137'h0d85759f78816a5ca8bac23cb8d9ff155b2;
    stim[53] = 137'h0e78d6f6602a3c3f6d038c22540c76e6126;
    stim[54] = 137'h075b66ef4957dfb1002e425dc3945ab2f69;
    stim[55] = 137'h08b526beae4a939b02cdae12ad9ea6b061f;
    stim[56] = 137'h0125dc571c1fccb8642f7c3a9a3d1cb5f0e;
    stim[57] = 137'h08cc859d112e9a5e61e6ff0bb661796e14d;
    stim[58] = 137'h0d956319ec12d5bff4b7a2be04451749988;
    stim[59] = 137'h048d602e3e07284e6a799a00f655724c706;
    stim[60] = 137'h026397f4b3a51439532e6f79273c5f12114;
    stim[61] = 137'h0f3018e133ff0b8662550ba85cb5b5c5f3c;
    stim[62] = 137'h011bec7757beb1d787681a5aebd63a6f8c5;
    stim[63] = 137'h091b0c1a697e9e0b907f41379ca434061a6;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h00;
      expv[3] = 7'h00;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h00;
      expv[8] = 7'h00;
      expv[9] = 7'h00;
      expv[10] = 7'h00;
      expv[11] = 7'h00;
      expv[12] = 7'h00;
      expv[13] = 7'h00;
      expv[14] = 7'h00;
      expv[15] = 7'h00;
      expv[16] = 7'h00;
      expv[17] = 7'h00;
      expv[18] = 7'h00;
      expv[19] = 7'h00;
      expv[20] = 7'h00;
      expv[21] = 7'h00;
      expv[22] = 7'h00;
      expv[23] = 7'h00;
      expv[24] = 7'h00;
      expv[25] = 7'h00;
      expv[26] = 7'h00;
      expv[27] = 7'h00;
      expv[28] = 7'h00;
      expv[29] = 7'h00;
      expv[30] = 7'h00;
      expv[31] = 7'h00;
      expv[32] = 7'h00;
      expv[33] = 7'h00;
      expv[34] = 7'h00;
      expv[35] = 7'h00;
      expv[36] = 7'h00;
      expv[37] = 7'h00;
      expv[38] = 7'h00;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h00;
      expv[42] = 7'h00;
      expv[43] = 7'h00;
      expv[44] = 7'h00;
      expv[45] = 7'h00;
      expv[46] = 7'h00;
      expv[47] = 7'h00;
      expv[48] = 7'h00;
      expv[49] = 7'h00;
      expv[50] = 7'h00;
      expv[51] = 7'h00;
      expv[52] = 7'h00;
      expv[53] = 7'h00;
      expv[54] = 7'h00;
      expv[55] = 7'h00;
      expv[56] = 7'h00;
      expv[57] = 7'h00;
      expv[58] = 7'h00;
      expv[59] = 7'h00;
      expv[60] = 7'h00;
      expv[61] = 7'h00;
      expv[62] = 7'h00;
      expv[63] = 7'h00;
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
