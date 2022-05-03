TRUNCATE public.template RESTART IDENTITY;

INSERT INTO public.configuration (info, updated_on, updated_by) VALUES ('{"companyNameShort":"Twilio","companyNameLong":"Twilio","welcomeKnownContact":"Bonjour, bienvenue chez {{companyNameLong}}, je vous mets en relation avec votre conseiller.","welcomeUnknownContact":"Bonjour, bienvenue chez {{companyNameLong}}. Je vous redirige vers le premier conseiller disponible de notre centre d''appel.","agentBusyAnswer":"Votre conseiller est occupé, je vous redirige vers le centre d''appel.","agentNotFoundAnswer":"Je vous redirige vers le premier conseiller disponible de notre centre d''appel."}', NOW(), 'prajendirane@twilio.com');


INSERT INTO public.template (category_id, content, whatsapp_approved, is_deleted) VALUES (1, 'Bonjour {{customerFirstname}}, je suis {{agentFirstname}} {{agentLastname}}, votre conseiller chez {{companyNameShort}}, je me permets de vous contacter pour qu''on puisse discuter de votre contrat. Envoyez moi un message dès que vous êtes disponible. Merci.', true, false);
INSERT INTO public.template (category_id, content, whatsapp_approved, is_deleted) VALUES (1, 'Bonjour {{customerFirstname}} nous avons traité vos documents, vous pouvez me contacter ici. {{agentFirstname}} de chez {{companyNameShort}}.', false, false);
INSERT INTO public.template (category_id, content, whatsapp_approved, is_deleted) VALUES (2, 'Toutes les réductions indiquées sont appliquées après signature. {{agentFirstname}} de chez {{companyNameShort}}.', false, false);
INSERT INTO public.template (category_id, content, whatsapp_approved, is_deleted) VALUES (3, 'Je vous remercie de m''avoir contacté, {{customerFirstname}}. Si vous avez d''autres questions, n''hésitez à me recontacter sur ce même numéro. {{agentFirstname}} de chez {{companyNameShort}}.', false, false);